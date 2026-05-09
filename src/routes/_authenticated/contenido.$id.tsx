import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Contenido } from "@/lib/supabase";
import { ArrowLeft, AlertTriangle } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Markdown } from "@/components/Markdown";

export const Route = createFileRoute("/_authenticated/contenido/$id")({
  component: ContenidoPage,
});

function ContenidoPage() {
  const { id } = Route.useParams();
  const { data, isLoading } = useQuery({
    queryKey: ["contenido", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("contenido")
        .select("*")
        .eq("id", id)
        .maybeSingle();
      if (error) throw error;
      return data as Contenido | null;
    },
  });

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
        <p className="mt-6 text-sm text-muted-foreground">Contenido no encontrado.</p>
      ) : (
        <article className="mt-5">
          <h1 className="text-2xl font-bold leading-tight">{data.titulo}</h1>
          {data.nivel && (
            <Badge className="mt-3 bg-primary-soft text-primary hover:bg-primary-soft">
              {data.nivel}
            </Badge>
          )}
          <Markdown className="mt-6">{data.cuerpo ?? ""}</Markdown>

          <Link to="/reporte" search={{ contenido: data.id }}>
            <Button variant="outline" className="mt-8 w-full gap-2">
              <AlertTriangle className="h-4 w-4" />
              Reportar este contenido
            </Button>
          </Link>
        </article>
      )}
    </div>
  );
}
