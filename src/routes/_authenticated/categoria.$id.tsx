import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Categoria, type Contenido, type Tramite } from "@/lib/supabase";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, ChevronRight, Clock, FileText, BookOpen, GraduationCap } from "lucide-react";

export const Route = createFileRoute("/_authenticated/categoria/$id")({
  component: CategoriaPage,
});

function nivelBadge(nivel: string | null) {
  const v = (nivel ?? "").toLowerCase();
  if (v.includes("avanz"))
    return <Badge className="bg-destructive/10 text-destructive hover:bg-destructive/10">Avanzado</Badge>;
  if (v.includes("inter"))
    return <Badge className="bg-warning/15 text-warning-foreground hover:bg-warning/15" style={{ color: "oklch(0.45 0.16 80)" }}>Intermedio</Badge>;
  if (v.includes("bas") || v.includes("bás"))
    return <Badge className="bg-primary-soft text-primary hover:bg-primary-soft">Básico</Badge>;
  return nivel ? <Badge variant="secondary">{nivel}</Badge> : null;
}

function CategoriaPage() {
  const { id } = Route.useParams();

  const { data: categoria } = useQuery({
    queryKey: ["categoria", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("categoria")
        .select("*")
        .eq("id", id)
        .maybeSingle();
      if (error) throw error;
      return data as Categoria | null;
    },
  });

  const { data: contenidos } = useQuery({
    queryKey: ["contenidos", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("contenido")
        .select("*")
        .eq("id_categoria", id);
      if (error) throw error;
      return data as Contenido[];
    },
  });

  const { data: tramites } = useQuery({
    queryKey: ["tramites", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("tramite")
        .select("*")
        .eq("id_categoria", id);
      if (error) throw error;
      return data as Tramite[];
    },
  });

  return (
    <div className="px-5 pt-6">
      <Link to="/home" className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground">
        <ArrowLeft className="h-4 w-4" /> Volver
      </Link>

      <header className="mt-4 rounded-2xl bg-gradient-to-br from-primary to-primary/80 p-6 text-primary-foreground">
        <h1 className="text-2xl font-bold leading-tight">{categoria?.nombre ?? "Categoría"}</h1>
        {categoria?.descripcion && (
          <p className="mt-2 text-sm opacity-90">{categoria.descripcion}</p>
        )}
      </header>

      <Link to="/evaluacion/$id" params={{ id }}>
        <Button className="mt-5 h-12 w-full text-base font-semibold gap-2">
          <GraduationCap className="h-5 w-5" />
          Evalúa tu conocimiento
        </Button>
      </Link>

      <section className="mt-8">
        <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          <BookOpen className="h-4 w-4" /> Contenidos
        </h2>
        {contenidos && contenidos.length > 0 ? (
          <ul className="space-y-2">
            {contenidos.map((c) => (
              <li key={c.id}>
                <Link
                  to="/contenido/$id"
                  params={{ id: c.id }}
                  className="flex items-center gap-3 rounded-xl border bg-card p-4 active:scale-[0.99]"
                >
                  <div className="min-w-0 flex-1">
                    <h3 className="truncate font-medium">{c.titulo}</h3>
                    <div className="mt-1.5">{nivelBadge(c.nivel)}</div>
                  </div>
                  <ChevronRight className="h-5 w-5 text-muted-foreground" />
                </Link>
              </li>
            ))}
          </ul>
        ) : (
          <p className="text-sm text-muted-foreground">Sin contenidos por ahora.</p>
        )}
      </section>

      <section className="mt-8">
        <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          <FileText className="h-4 w-4" /> Trámites
        </h2>
        {tramites && tramites.length > 0 ? (
          <ul className="space-y-2">
            {tramites.map((t) => (
              <li key={t.id}>
                <Link
                  to="/tramite/$id"
                  params={{ id: t.id }}
                  className="flex items-center gap-3 rounded-xl border bg-card p-4 active:scale-[0.99]"
                >
                  <div className="min-w-0 flex-1">
                    <h3 className="truncate font-medium">{t.nombre}</h3>
                    {t.tiempo_estimado && (
                      <p className="mt-1 inline-flex items-center gap-1 text-xs text-muted-foreground">
                        <Clock className="h-3.5 w-3.5" /> {t.tiempo_estimado}
                      </p>
                    )}
                  </div>
                  <ChevronRight className="h-5 w-5 text-muted-foreground" />
                </Link>
              </li>
            ))}
          </ul>
        ) : (
          <p className="text-sm text-muted-foreground">Sin trámites por ahora.</p>
        )}
      </section>
    </div>
  );
}
