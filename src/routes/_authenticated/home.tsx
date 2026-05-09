import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase, type Categoria } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { ArrowRight, Wallet, FileText, Bus, Sparkles, Search, BookOpen } from "lucide-react";
import { useEffect, useMemo, useState } from "react";
import { Input } from "@/components/ui/input";

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

function excerpt(text: string | null, len = 120) {
  if (!text) return "";
  const clean = text.replace(/[#*_`>~\-]+/g, " ").replace(/\s+/g, " ").trim();
  return clean.length > len ? clean.slice(0, len) + "…" : clean;
}

function useDebounced(value: string, delay = 300) {
  const [v, setV] = useState(value);
  useEffect(() => {
    const t = setTimeout(() => setV(value), delay);
    return () => clearTimeout(t);
  }, [value, delay]);
  return v;
}

type ContenidoResult = {
  id: string;
  titulo: string;
  cuerpo: string | null;
  id_categoria: string;
  categoria?: { nombre: string } | null;
};

type TramiteResult = {
  id: string;
  nombre: string;
  requisitos: string | null;
  id_categoria: string;
  categoria?: { nombre: string } | null;
};

function HomePage() {
  const { user } = useAuth();
  const [nombre, setNombre] = useState<string>("");
  const [query, setQuery] = useState("");
  const debounced = useDebounced(query.trim(), 250);

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

  const { data: search, isFetching: searching } = useQuery({
    queryKey: ["search", debounced],
    enabled: debounced.length >= 2,
    queryFn: async () => {
      const like = `%${debounced}%`;
      const [c, t] = await Promise.all([
        supabase
          .from("contenido")
          .select("id, titulo, cuerpo, id_categoria, categoria(nombre)")
          .or(`titulo.ilike.${like},cuerpo.ilike.${like}`)
          .limit(15),
        supabase
          .from("tramite")
          .select("id, nombre, requisitos, id_categoria, categoria(nombre)")
          .or(`nombre.ilike.${like},requisitos.ilike.${like}`)
          .limit(15),
      ]);
      return {
        contenidos: (c.data ?? []) as unknown as ContenidoResult[],
        tramites: (t.data ?? []) as unknown as TramiteResult[],
      };
    },
  });

  const showSearch = debounced.length >= 2;
  const totalResults = useMemo(
    () => (search ? search.contenidos.length + search.tramites.length : 0),
    [search],
  );

  return (
    <div className="px-5 pt-8">
      <header className="mb-6">
        <p className="text-sm font-medium text-primary">Bienvenido</p>
        <h1 className="mt-1 text-2xl font-bold leading-tight">
          {nombre ? `¡Hola, ${nombre.split(" ")[0]}!` : "¡Hola!"}
        </h1>
        <p className="mt-1 text-sm text-muted-foreground">
          ¿Qué quieres aprender hoy?
        </p>
      </header>

      <div className="relative mb-6">
        <Search className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
        <Input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Buscar contenidos y trámites…"
          className="h-12 pl-10"
        />
      </div>

      {showSearch ? (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
            Resultados {search ? `(${totalResults})` : ""}
          </h2>

          {searching && !search ? (
            <div className="space-y-2">
              {[0, 1, 2].map((i) => (
                <div key={i} className="h-20 animate-pulse rounded-xl bg-muted" />
              ))}
            </div>
          ) : !search || totalResults === 0 ? (
            <p className="text-sm text-muted-foreground">
              No encontramos resultados para "{debounced}".
            </p>
          ) : (
            <div className="space-y-6">
              {search.contenidos.length > 0 && (
                <div>
                  <h3 className="mb-2 flex items-center gap-1.5 text-xs font-semibold uppercase tracking-wide text-primary">
                    <BookOpen className="h-3.5 w-3.5" /> Contenidos
                  </h3>
                  <ul className="space-y-2">
                    {search.contenidos.map((c) => (
                      <li key={c.id}>
                        <Link
                          to="/contenido/$id"
                          params={{ id: c.id }}
                          className="block rounded-xl border bg-card p-4 active:scale-[0.99]"
                        >
                          <p className="font-medium">{c.titulo}</p>
                          {c.categoria?.nombre && (
                            <p className="mt-0.5 text-xs text-primary">
                              {c.categoria.nombre}
                            </p>
                          )}
                          <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">
                            {excerpt(c.cuerpo)}
                          </p>
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              )}

              {search.tramites.length > 0 && (
                <div>
                  <h3 className="mb-2 flex items-center gap-1.5 text-xs font-semibold uppercase tracking-wide text-primary">
                    <FileText className="h-3.5 w-3.5" /> Trámites
                  </h3>
                  <ul className="space-y-2">
                    {search.tramites.map((t) => (
                      <li key={t.id}>
                        <Link
                          to="/tramite/$id"
                          params={{ id: t.id }}
                          className="block rounded-xl border bg-card p-4 active:scale-[0.99]"
                        >
                          <p className="font-medium">{t.nombre}</p>
                          {t.categoria?.nombre && (
                            <p className="mt-0.5 text-xs text-primary">
                              {t.categoria.nombre}
                            </p>
                          )}
                          <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">
                            {excerpt(t.requisitos)}
                          </p>
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          )}
        </section>
      ) : (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
            Categorías
          </h2>
          {isLoading ? (
            <div className="space-y-3">
              {[0, 1, 2].map((i) => (
                <div key={i} className="h-28 animate-pulse rounded-2xl bg-muted" />
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
      )}
    </div>
  );
}
