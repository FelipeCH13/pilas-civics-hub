import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { useState } from "react";
import { supabase, type Pregunta } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { Button } from "@/components/ui/button";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import { ArrowLeft, Trophy, RotateCcw } from "lucide-react";
import { toast } from "sonner";

export const Route = createFileRoute("/_authenticated/evaluacion/$id")({
  component: EvaluacionPage,
});

function letterFor(opt: "a" | "b" | "c" | "d") {
  return opt.toUpperCase();
}

function EvaluacionPage() {
  const { id } = Route.useParams();
  const { user } = useAuth();
  const navigate = useNavigate();

  const { data: preguntas, isLoading } = useQuery({
    queryKey: ["preguntas", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("pregunta")
        .select("*")
        .eq("id_categoria", id);
      if (error) throw error;
      return data as Pregunta[];
    },
  });

  const [idx, setIdx] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [done, setDone] = useState<{ score: number; total: number } | null>(null);
  const [submitting, setSubmitting] = useState(false);

  if (isLoading) {
    return <div className="p-6"><div className="h-40 animate-pulse rounded-2xl bg-muted" /></div>;
  }
  if (!preguntas || preguntas.length === 0) {
    return (
      <div className="px-5 pt-6">
        <Link to="/categoria/$id" params={{ id }} className="inline-flex items-center gap-1 text-sm text-muted-foreground">
          <ArrowLeft className="h-4 w-4" /> Volver
        </Link>
        <p className="mt-6 text-sm text-muted-foreground">
          Aún no hay preguntas para esta categoría.
        </p>
      </div>
    );
  }

  const current = preguntas[idx];
  const isLast = idx === preguntas.length - 1;
  const selected = answers[current.id];

  const submit = async () => {
    setSubmitting(true);
    let score = 0;
    for (const p of preguntas) {
      if ((answers[p.id] ?? "").toLowerCase() === (p.respuesta_correcta ?? "").toLowerCase()) {
        score++;
      }
    }
    if (user) {
      const { error } = await supabase.from("evaluacion").insert({
        id_usuario: user.id,
        id_categoria: id,
        puntaje: score,
        puntaje_maximo: preguntas.length,
      });
      if (error) toast.error("No se pudo guardar el resultado: " + error.message);
    }
    setSubmitting(false);
    setDone({ score, total: preguntas.length });
  };

  if (done) {
    const pct = Math.round((done.score / done.total) * 100);
    const msg =
      pct >= 80
        ? "¡Excelente! Dominas este tema."
        : pct >= 50
        ? "Vas bien, pero puedes mejorar. Te recomendamos repasar los contenidos."
        : "Te recomendamos revisar los artículos de esta categoría antes de intentarlo de nuevo.";
    return (
      <div className="px-5 pt-10">
        <div className="rounded-3xl bg-gradient-to-br from-primary to-primary/80 p-8 text-center text-primary-foreground">
          <Trophy className="mx-auto h-14 w-14" />
          <h1 className="mt-4 text-3xl font-bold">
            {done.score} de {done.total} correctas
          </h1>
          <p className="mt-2 text-sm opacity-90">{pct}%</p>
        </div>
        <p className="mt-6 text-center text-base font-medium">{msg}</p>
        <div className="mt-8 space-y-3">
          <Button
            className="w-full h-12"
            onClick={() => navigate({ to: "/categoria/$id", params: { id } })}
          >
            Repasar contenidos
          </Button>
          <Button
            variant="outline"
            className="w-full h-12"
            onClick={() => navigate({ to: "/home" })}
          >
            Volver al inicio
          </Button>
          <Button
            variant="ghost"
            className="w-full h-12 gap-2"
            onClick={() => {
              setAnswers({});
              setIdx(0);
              setDone(null);
            }}
          >
            <RotateCcw className="h-4 w-4" /> Intentar de nuevo
          </Button>
        </div>
      </div>
    );
  }

  const opts = [
    { k: "a", txt: current.opcion_a },
    { k: "b", txt: current.opcion_b },
    { k: "c", txt: current.opcion_c },
    { k: "d", txt: current.opcion_d },
  ] as const;

  return (
    <div className="px-5 pt-6">
      <Link
        to="/categoria/$id"
        params={{ id }}
        className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" /> Salir
      </Link>

      <div className="mt-4 flex items-center justify-between">
        <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
          Pregunta {idx + 1} de {preguntas.length}
        </p>
      </div>
      <div className="mt-2 h-2 overflow-hidden rounded-full bg-muted">
        <div
          className="h-full bg-primary transition-all"
          style={{ width: `${((idx + 1) / preguntas.length) * 100}%` }}
        />
      </div>

      <h1 className="mt-6 text-xl font-semibold leading-snug">
        {current.enunciado}
      </h1>

      <RadioGroup
        value={selected ?? ""}
        onValueChange={(v) => setAnswers((a) => ({ ...a, [current.id]: v }))}
        className="mt-6 space-y-3"
      >
        {opts.map((o) => (
          <Label
            key={o.k}
            htmlFor={`opt-${o.k}`}
            className={`flex cursor-pointer items-start gap-3 rounded-xl border p-4 transition ${
              selected === o.k
                ? "border-primary bg-primary-soft"
                : "border-border bg-card"
            }`}
          >
            <RadioGroupItem id={`opt-${o.k}`} value={o.k} className="mt-0.5" />
            <span className="flex-1 text-[15px] leading-relaxed">
              <span className="mr-2 font-semibold text-primary">
                {letterFor(o.k)}.
              </span>
              {o.txt}
            </span>
          </Label>
        ))}
      </RadioGroup>

      <div className="mt-8 flex gap-3">
        {idx > 0 && (
          <Button
            variant="outline"
            className="flex-1 h-12"
            onClick={() => setIdx((i) => i - 1)}
          >
            Anterior
          </Button>
        )}
        {!isLast ? (
          <Button
            className="flex-1 h-12"
            disabled={!selected}
            onClick={() => setIdx((i) => i + 1)}
          >
            Siguiente
          </Button>
        ) : (
          <Button
            className="flex-1 h-12"
            disabled={!selected || submitting}
            onClick={submit}
          >
            {submitting ? "Guardando…" : "Finalizar"}
          </Button>
        )}
      </div>
    </div>
  );
}
