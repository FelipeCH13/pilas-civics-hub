import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Tramite } from "@/lib/supabase";
import { ArrowLeft, Clock, ExternalLink, ListChecks } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Markdown } from "@/components/Markdown";

export const Route = createFileRoute("/_authenticated/tramite/$id")({
  component: TramitePage,
});

function parsePasos(pasos: string | null): string[] {
  if (!pasos) return [];
  // try JSON array first
  try {
    const j = JSON.parse(pasos);
    if (Array.isArray(j)) return j.map(String).filter(Boolean);
  } catch {
    // ignore
  }
  return pasos
    .split(/\r?\n|(?:\d+\.)|;|\|/)
    .map((s) => s.trim())
    .filter(Boolean);
}

function TramitePage() {
  const { id } = Route.useParams();
  const { data, isLoading } = useQuery({
    queryKey: ["tramite", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("tramite")
        .select("*")
        .eq("id", id)
        .maybeSingle();
      if (error) throw error;
      return data as Tramite | null;
    },
  });

  const pasos = parsePasos(data?.pasos ?? null);

  return (
    <div className="px-5 pt-6">
      <Link
        to="/categoria/$id"
        params={{ id: data?.id_categoria ?? "" }}
        className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" /> Volver
      </Link>

      {isLoading ? (
        <div className="mt-6 h-40 animate-pulse rounded-2xl bg-muted" />
      ) : !data ? (
        <p className="mt-6 text-sm text-muted-foreground">Trámite no encontrado.</p>
      ) : (
        <article className="mt-5 space-y-6">
          <div>
            <h1 className="text-2xl font-bold leading-tight">{data.nombre}</h1>
            {data.tiempo_estimado && (
              <p className="mt-2 inline-flex items-center gap-1.5 rounded-full bg-primary-soft px-3 py-1 text-xs font-medium text-primary">
                <Clock className="h-3.5 w-3.5" /> {data.tiempo_estimado}
              </p>
            )}
          </div>

          {data.requisitos && (
            <section>
              <h2 className="mb-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
                Requisitos
              </h2>
              <div className="rounded-xl border bg-card p-4">
                <Markdown>{data.requisitos}</Markdown>
              </div>
            </section>
          )}

          {pasos.length > 0 && (
            <section>
              <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
                <ListChecks className="h-4 w-4" /> Pasos
              </h2>
              <ol className="space-y-3">
                {pasos.map((p, i) => (
                  <li
                    key={i}
                    className="flex gap-3 rounded-xl border bg-card p-4"
                  >
                    <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-primary text-sm font-semibold text-primary-foreground">
                      {i + 1}
                    </span>
                    <div className="flex-1"><Markdown>{p}</Markdown></div>
                  </li>
                ))}
              </ol>
            </section>
          )}

          {data.enlace && (
            <a href={data.enlace} target="_blank" rel="noopener noreferrer">
              <Button className="h-12 w-full gap-2 text-base">
                <ExternalLink className="h-5 w-5" />
                Ir al sitio oficial
              </Button>
            </a>
          )}
        </article>
      )}
    </div>
  );
}
