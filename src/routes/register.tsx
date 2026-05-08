import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/lib/auth-context";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { toast } from "sonner";

export const Route = createFileRoute("/register")({
  component: RegisterPage,
});

const PERFILES = [
  "Educación Financiera",
  "Trámites Administrativos",
  "Movilidad Urbana",
  "Todas",
];

function RegisterPage() {
  const { user, loading } = useAuth();
  const navigate = useNavigate();
  const [nombre, setNombre] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [perfil, setPerfil] = useState("Todas");
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    if (!loading && user) navigate({ to: "/home", replace: true });
  }, [loading, user, navigate]);

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitting(true);
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: window.location.origin + "/home",
        data: { nombre, perfil_interes: perfil },
      },
    });
    if (error) {
      setSubmitting(false);
      toast.error(error.message);
      return;
    }

    const uid = data.user?.id;
    if (uid) {
      const { error: insErr } = await supabase.from("usuario").insert({
        id: uid,
        nombre,
        correo: email,
        perfil_interes: perfil,
      });
      if (insErr) console.warn("usuario insert:", insErr.message);
    }

    setSubmitting(false);
    toast.success("¡Cuenta creada!");
    navigate({ to: data.session ? "/home" : "/login", replace: true });
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-primary-soft to-background">
      <div className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-6 py-12">
        <div className="mb-8 text-center">
          <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-2xl bg-primary text-primary-foreground text-2xl font-bold">
            P
          </div>
          <h1 className="text-2xl font-bold">Crea tu cuenta</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            Aprende sobre lo que más te interesa
          </p>
        </div>
        <form
          onSubmit={onSubmit}
          className="rounded-2xl border bg-card p-6 shadow-sm space-y-4"
        >
          <div className="space-y-2">
            <Label htmlFor="nombre">Nombre</Label>
            <Input
              id="nombre"
              required
              value={nombre}
              onChange={(e) => setNombre(e.target.value)}
              placeholder="Tu nombre"
            />
          </div>
          <div className="space-y-2">
            <Label htmlFor="email">Correo</Label>
            <Input
              id="email"
              type="email"
              required
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="tucorreo@ejemplo.com"
            />
          </div>
          <div className="space-y-2">
            <Label htmlFor="password">Contraseña</Label>
            <Input
              id="password"
              type="password"
              required
              minLength={6}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Mínimo 6 caracteres"
            />
          </div>
          <div className="space-y-2">
            <Label>Tema de interés</Label>
            <Select value={perfil} onValueChange={setPerfil}>
              <SelectTrigger>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {PERFILES.map((p) => (
                  <SelectItem key={p} value={p}>
                    {p}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
          <Button type="submit" className="w-full h-11" disabled={submitting}>
            {submitting ? "Creando…" : "Crear cuenta"}
          </Button>
          <p className="text-center text-sm text-muted-foreground">
            ¿Ya tienes cuenta?{" "}
            <Link to="/login" className="font-medium text-primary">
              Inicia sesión
            </Link>
          </p>
        </form>
      </div>
    </div>
  );
}
