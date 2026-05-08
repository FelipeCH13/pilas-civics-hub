import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Categoria } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { ArrowRight, Wallet, FileText, Bus, Sparkles } from "lucide-react";
import { useEffect, useState } from "react";

export const Route = createFileRoute("/_authenticated/home")({
  component: HomePage,
});

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

function HomePage() {
  const { user } = useAuth();
  const [nombre, setNombre] = useState<string>("");

  useEffect(() => {
    if (!user) return;
    supabase
      .from("usuario")
      .select("nombre")
      .eq("id", user.id)
      .maybeSingle()
      .then(({ data }) => setNombre(data?.nombre ?? ""));
  }, [user]);

  const { data: categorias, isLoading } = useQuery({
    queryKey: ["categorias"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("categoria")
        .select("*")
        .order("nombre");
      if (error) throw error;
      return data as Categoria[];
    },
  });

  return (
    <div className="px-5 pt-8">
      <header className="mb-8">
        <p className="text-sm font-medium text-primary">Bienvenido</p>
        <h1 className="mt-1 text-2xl font-bold leading-tight">
          {nombre ? `¡Hola, ${nombre.split(" ")[0]}!` : "¡Hola!"}
        </h1>
        <p className="mt-1 text-sm text-muted-foreground">
          ¿Qué quieres aprender hoy?
        </p>
      </header>

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          Categorías
        </h2>
        {isLoading ? (
          <div className="space-y-3">
            {[0, 1, 2].map((i) => (
              <div
                key={i}
                className="h-28 animate-pulse rounded-2xl bg-muted"
              />
            ))}
          </div>
        ) : (
          <ul className="space-y-3">
            {categorias?.map((c) => {
              const Icon = pickIcon(c.nombre);
              return (
                <li key={c.id}>
                  <Link
                    to="/categoria/$id"
                    params={{ id: c.id }}
                    className="group flex items-center gap-4 rounded-2xl border border-border bg-card p-4 shadow-sm transition active:scale-[0.99]"
                  >
                    <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-xl bg-primary-soft text-primary">
                      <Icon className="h-7 w-7" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <h3 className="truncate font-semibold">{c.nombre}</h3>
                      {c.descripcion && (
                        <p className="line-clamp-2 text-sm text-muted-foreground">
                          {c.descripcion}
                        </p>
                      )}
                    </div>
                    <ArrowRight className="h-5 w-5 text-muted-foreground group-hover:text-primary" />
                  </Link>
                </li>
              );
            })}
            {categorias?.length === 0 && (
              <p className="text-sm text-muted-foreground">
                Aún no hay categorías disponibles.
              </p>
            )}
          </ul>
        )}
      </section>
    </div>
  );
}
