import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ArrowLeft } from "lucide-react";
import { toast } from "sonner";

type Search = { contenido?: string };

export const Route = createFileRoute("/_authenticated/reporte")({
  validateSearch: (s): Search => ({
    contenido: typeof s.contenido === "string" ? s.contenido : undefined,
  }),
  component: ReportePage,
});

function ReportePage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { contenido } = Route.useSearch();
  const [idContenido, setIdContenido] = useState(contenido ?? "");
  const [problema, setProblema] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!user) return;
    if (problema.trim().length < 10) {
      toast.error("Describe el problema con al menos 10 caracteres.");
      return;
    }
    setSubmitting(true);
    const { error } = await supabase.from("reporte").insert({
      id_usuario: user.id,
      id_contenido: idContenido || null,
      problema: problema.trim(),
      estado: "pendiente",
    });
    setSubmitting(false);
    if (error) {
      toast.error("No se pudo enviar: " + error.message);
      return;
    }
    toast.success("¡Reporte enviado! Gracias por avisarnos.");
    navigate({ to: "/perfil" });
  };

  return (
    <div className="px-5 pt-6">
      <button
        onClick={() => history.back()}
        className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" /> Volver
      </button>
      <h1 className="mt-4 text-2xl font-bold">Reportar contenido</h1>
      <p className="mt-1 text-sm text-muted-foreground">
        Cuéntanos qué información está incorrecta o desactualizada.
      </p>

      <form onSubmit={onSubmit} className="mt-6 space-y-4">
        <div className="space-y-2">
          <Label htmlFor="cid">ID del contenido (opcional)</Label>
          <Input
            id="cid"
            value={idContenido}
            onChange={(e) => setIdContenido(e.target.value)}
            placeholder="Si lo conoces"
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="problema">Describe el problema</Label>
          <Textarea
            id="problema"
            required
            rows={6}
            maxLength={1000}
            value={problema}
            onChange={(e) => setProblema(e.target.value)}
            placeholder="Ej: el enlace al sitio oficial no funciona…"
          />
          <p className="text-right text-xs text-muted-foreground">
            {problema.length}/1000
          </p>
        </div>
        <Button type="submit" className="w-full h-12" disabled={submitting}>
          {submitting ? "Enviando…" : "Enviar reporte"}
        </Button>
      </form>
    </div>
  );
}
