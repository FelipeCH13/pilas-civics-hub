import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useEffect, useState } from "react";
import { supabase, type Usuario, type Categoria } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import {
  LogOut,
  AlertTriangle,
  Mail,
  Heart,
  Trophy,
  Wallet,
  FileText,
  Bus,
  Sparkles,
  BarChart3,
} from "lucide-react";

const ICONS: Record<string, typeof Wallet> = {
  financiera: Wallet,
  finanzas: Wallet,
  tramites: FileText,
  "trámites": FileText,
  movilidad: Bus,
};
function pickIcon(nombre: string) {
  const k = nombre.toLowerCase();
  for (const key of Object.keys(ICONS)) if (k.includes(key)) return ICONS[key];
  return Sparkles;
}

function getLabel(pct: number, count: number) {
  if (count === 0) return { text: "Aún no evaluado", cls: "bg-muted text-muted-foreground" };
  if (pct === 0) return { text: "Sin iniciar", cls: "bg-muted text-muted-foreground" };
  if (pct < 50) return { text: "En progreso", cls: "bg-yellow-100 text-yellow-800" };
  if (pct < 80) return { text: "Aprendiendo", cls: "bg-blue-100 text-blue-800" };
  return { text: "Dominado", cls: "bg-green-100 text-green-800" };
}

export const Route = createFileRoute("/_authenticated/perfil")({
  component: PerfilPage,
});

type EvalRow = {
  id: string;
  puntaje: number;
  puntaje_maximo: number;
  fecha: string;
  id_categoria: string;
  categoria?: { nombre: string } | null;
};

function PerfilPage() {
  const { user, signOut } = useAuth();
  const navigate = useNavigate();
  const [perfil, setPerfil] = useState<Usuario | null>(null);

  useEffect(() => {
    if (!user) return;
    supabase
      .from("usuario")
      .select("*")
      .eq("id", user.id)
      .maybeSingle()
      .then(({ data }) => setPerfil((data as Usuario) ?? null));
  }, [user]);

  const { data: evals } = useQuery({
    queryKey: ["evals", user?.id],
    enabled: !!user,
    queryFn: async () => {
      const { data, error } = await supabase
        .from("evaluacion")
        .select("id, puntaje, puntaje_maximo, fecha, id_categoria, categoria(nombre)")
        .eq("id_usuario", user!.id)
        .order("fecha", { ascending: false })
        .limit(5);
      if (error) throw error;
      return data as unknown as EvalRow[];
    },
  });

  const { data: categorias } = useQuery({
    queryKey: ["categorias"],
    queryFn: async () => {
      const { data, error } = await supabase.from("categoria").select("*").order("nombre");
      if (error) throw error;
      return data as Categoria[];
    },
  });

  const { data: allEvals } = useQuery({
    queryKey: ["all-evals", user?.id],
    enabled: !!user,
    queryFn: async () => {
      const { data, error } = await supabase
        .from("evaluacion")
        .select("id_categoria, puntaje, puntaje_maximo")
        .eq("id_usuario", user!.id);
      if (error) throw error;
      return data as { id_categoria: string; puntaje: number; puntaje_maximo: number }[];
    },
  });

  const statsByCat: Record<string, { pct: number; count: number }> = {};
  if (allEvals) {
    for (const e of allEvals) {
      const s = statsByCat[e.id_categoria] ?? { sum: 0, count: 0 };
      (s as any).sum = ((s as any).sum ?? 0) + (e.puntaje / e.puntaje_maximo) * 100;
      s.count += 1;
      statsByCat[e.id_categoria] = s as any;
    }
    for (const k of Object.keys(statsByCat)) {
      const s: any = statsByCat[k];
      statsByCat[k] = { pct: Math.round(s.sum / s.count), count: s.count };
    }
  }

  const handleLogout = async () => {
    await signOut();
    navigate({ to: "/login", replace: true });
  };

  return (
    <div className="px-5 pt-8">
      <div className="rounded-3xl bg-gradient-to-br from-primary to-primary/80 p-6 text-primary-foreground">
        <div className="flex h-16 w-16 items-center justify-center rounded-full bg-white/20 text-2xl font-bold">
          {(perfil?.nombre ?? user?.email ?? "?").charAt(0).toUpperCase()}
        </div>
        <h1 className="mt-4 text-2xl font-bold">{perfil?.nombre ?? "Mi perfil"}</h1>
        <p className="mt-1 inline-flex items-center gap-1.5 text-sm opacity-90">
          <Mail className="h-4 w-4" /> {perfil?.correo ?? user?.email}
        </p>
        {perfil?.perfil_interes && (
          <p className="mt-1 inline-flex items-center gap-1.5 text-sm opacity-90">
            <Heart className="h-4 w-4" /> {perfil.perfil_interes}
          </p>
        )}
      </div>

      <section className="mt-8">
        <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          <BarChart3 className="h-4 w-4" /> Mi progreso
        </h2>
        {!categorias || !allEvals ? (
          <div className="h-32 animate-pulse rounded-xl bg-muted" />
        ) : (
          <ul className="space-y-3">
            {categorias.map((c) => {
              const Icon = pickIcon(c.nombre);
              const stat = statsByCat[c.id] ?? { pct: 0, count: 0 };
              const label = getLabel(stat.pct, stat.count);
              const empty = stat.count === 0;
              return (
                <li
                  key={c.id}
                  className={`rounded-2xl border p-4 ${empty ? "bg-muted/40" : "bg-card"}`}
                >
                  <div className="flex items-center gap-3">
                    <div
                      className={`flex h-11 w-11 shrink-0 items-center justify-center rounded-xl ${
                        empty ? "bg-muted text-muted-foreground" : "bg-primary-soft text-primary"
                      }`}
                    >
                      <Icon className="h-5 w-5" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="truncate font-semibold">{c.nombre}</p>
                      <p className="text-xs text-muted-foreground">
                        {empty
                          ? "Aún no evaluado"
                          : `${stat.count} ${stat.count === 1 ? "evaluación" : "evaluaciones"}`}
                      </p>
                    </div>
                    <span
                      className={`shrink-0 rounded-full px-2.5 py-1 text-xs font-medium ${label.cls}`}
                    >
                      {label.text}
                    </span>
                  </div>
                  {empty ? (
                    <Button
                      size="sm"
                      className="mt-3 w-full"
                      onClick={() => navigate({ to: "/evaluacion/$id", params: { id: c.id } })}
                    >
                      Comenzar evaluación
                    </Button>
                  ) : (
                    <div className="mt-3">
                      <div className="mb-1 flex justify-between text-xs">
                        <span className="text-muted-foreground">Promedio</span>
                        <span className="font-semibold text-primary">{stat.pct}%</span>
                      </div>
                      <Progress value={stat.pct} />
                    </div>
                  )}
                </li>
              );
            })}
          </ul>
        )}
      </section>

      <section className="mt-8">
        <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          <Trophy className="h-4 w-4" /> Mis evaluaciones
        </h2>
        {!evals ? (
          <div className="h-24 animate-pulse rounded-xl bg-muted" />
        ) : evals.length === 0 ? (
          <p className="text-sm text-muted-foreground">
            Aún no has completado evaluaciones.
          </p>
        ) : (
          <ul className="space-y-2">
            {evals.map((e) => {
              const pct = Math.round((e.puntaje / e.puntaje_maximo) * 100);
              return (
                <li
                  key={e.id}
                  className="flex items-center justify-between rounded-xl border bg-card p-4"
                >
                  <div className="min-w-0">
                    <p className="truncate font-medium">
                      {e.categoria?.nombre ?? "Categoría"}
                    </p>
                    <p className="text-xs text-muted-foreground">
                      {new Date(e.fecha).toLocaleDateString("es-CO", {
                        day: "numeric",
                        month: "short",
                        year: "numeric",
                      })}
                    </p>
                  </div>
                  <div className="text-right">
                    <p className="text-lg font-bold text-primary">
                      {e.puntaje}/{e.puntaje_maximo}
                    </p>
                    <p className="text-xs text-muted-foreground">{pct}%</p>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </section>

      <div className="mt-8 space-y-3">
        <Button
          variant="outline"
          className="w-full gap-2"
          onClick={() => navigate({ to: "/reporte" })}
        >
          <AlertTriangle className="h-4 w-4" /> Reportar contenido
        </Button>
        <Button
          variant="outline"
          className="w-full gap-2 text-destructive hover:text-destructive"
          onClick={handleLogout}
        >
          <LogOut className="h-4 w-4" /> Cerrar sesión
        </Button>
      </div>
    </div>
  );
}
