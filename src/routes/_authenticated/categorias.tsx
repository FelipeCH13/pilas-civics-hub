import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Categoria } from "@/lib/supabase";
import { ArrowRight, Wallet, FileText, Bus, Sparkles } from "lucide-react";

export const Route = createFileRoute("/_authenticated/categorias")({
  component: CategoriasPage,
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

function CategoriasPage() {
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
      <h1 className="text-2xl font-bold">Categorías</h1>
      <p className="mt-1 text-sm text-muted-foreground">
        Explora todos los temas disponibles.
      </p>

      <ul className="mt-6 space-y-3">
        {isLoading
          ? [0, 1, 2].map((i) => (
              <li key={i} className="h-28 animate-pulse rounded-2xl bg-muted" />
            ))
          : categorias?.map((c) => {
              const Icon = pickIcon(c.nombre);
              return (
                <li key={c.id}>
                  <Link
                    to="/categoria/$id"
                    params={{ id: c.id }}
                    className="flex items-center gap-4 rounded-2xl border bg-card p-4 shadow-sm active:scale-[0.99]"
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
                    <ArrowRight className="h-5 w-5 text-muted-foreground" />
                  </Link>
                </li>
              );
            })}
      </ul>
    </div>
  );
}
