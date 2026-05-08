import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect } from "react";
import { useAuth } from "@/lib/auth-context";

export const Route = createFileRoute("/")({
  component: Index,
});

function Index() {
  const { user, loading } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (loading) return;
    navigate({ to: user ? "/home" : "/login", replace: true });
  }, [loading, user, navigate]);

  return (
    <div className="flex min-h-screen items-center justify-center bg-background">
      <div className="text-center">
        <div className="mx-auto h-12 w-12 animate-pulse rounded-full bg-primary" />
        <p className="mt-4 text-sm text-muted-foreground">Cargando…</p>
      </div>
    </div>
  );
}
