import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = "https://mpouxgwipsnazvpxqszt.supabase.co";
const SUPABASE_ANON_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1wb3V4Z3dpcHNuYXp2cHhxc3p0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzgyNzAyMzAsImV4cCI6MjA5Mzg0NjIzMH0.bKuL96XZbxZzL1n5Mzs2_S517_zQ0JxjFmUm0iunW5U";

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    storage: typeof window !== "undefined" ? window.localStorage : undefined,
  },
});

export type Categoria = {
  id: string;
  nombre: string;
  descripcion: string | null;
  icono: string | null;
};

export type Contenido = {
  id: string;
  titulo: string;
  cuerpo: string;
  id_categoria: string;
  nivel: string | null;
  fecha_creacion?: string;
  fecha_actualizacion?: string;
};

export type Tramite = {
  id: string;
  nombre: string;
  requisitos: string | null;
  enlace: string | null;
  id_categoria: string;
  pasos: string | null;
  tiempo_estimado: string | null;
};

export type Pregunta = {
  id: string;
  id_categoria: string;
  enunciado: string;
  opcion_a: string;
  opcion_b: string;
  opcion_c: string;
  opcion_d: string;
  respuesta_correcta: string;
};

export type Evaluacion = {
  id: string;
  id_usuario: string;
  id_categoria: string;
  puntaje: number;
  puntaje_maximo: number;
  fecha: string;
};

export type Usuario = {
  id: string;
  nombre: string;
  correo: string;
  perfil_interes: string;
  fecha_registro?: string;
};
