-- ============================================================
-- PILAS CON EL DATO — Esquema de Base de Datos
-- Supabase / PostgreSQL
-- Proyecto de Grado 202016907 — UNAD
-- ============================================================

-- ============================================================
-- 1. CATEGORIA
-- ============================================================
CREATE TABLE categoria (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL,
    descripcion TEXT,
    icono     VARCHAR(50)   -- nombre del ícono (ej: 'wallet', 'car', 'file-text')
);

-- Datos iniciales (las 3 categorías del proyecto)
INSERT INTO categoria (nombre, descripcion, icono) VALUES
    ('Educación Financiera', 'Ahorro, crédito, presupuesto y seguridad digital financiera.', 'wallet'),
    ('Trámites Administrativos', 'Procesos ante el Estado: RUT, PQR, documentación personal.', 'file-text'),
    ('Movilidad Urbana', 'Normas de tránsito, derechos viales y transporte público.', 'car');


-- ============================================================
-- 2. USUARIO
-- Supabase maneja auth en su propio esquema (auth.users).
-- Esta tabla extiende el perfil del usuario autenticado.
-- ============================================================
CREATE TABLE usuario (
    id          UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    nombre      VARCHAR(150) NOT NULL,
    correo      VARCHAR(150) NOT NULL UNIQUE,
    -- perfil_interes: enum de las 3 categorías del proyecto
    perfil_interes VARCHAR(30) CHECK (
        perfil_interes IN ('financiera', 'tramites', 'movilidad', 'todas')
    ) DEFAULT 'todas',
    fecha_registro TIMESTAMPTZ DEFAULT NOW()
);


-- ============================================================
-- 3. CONTENIDO
-- CORRECCIÓN: se agrega campo 'cuerpo' con el texto del artículo
-- ============================================================
CREATE TABLE contenido (
    id              SERIAL PRIMARY KEY,
    titulo          VARCHAR(200) NOT NULL,
    cuerpo          TEXT NOT NULL,           -- ← CORRECCIÓN: contenido real del artículo
    id_categoria    INT NOT NULL REFERENCES categoria(id),
    nivel           VARCHAR(20) CHECK (
        nivel IN ('basico', 'intermedio', 'avanzado')
    ) DEFAULT 'basico',
    fecha_creacion     TIMESTAMPTZ DEFAULT NOW(),
    fecha_actualizacion TIMESTAMPTZ DEFAULT NOW()
);


-- ============================================================
-- 4. TRAMITE
-- NOTA: requisitos se mantiene como TEXT para el prototipo.
-- Documentar como deuda técnica: en producción sería una tabla
-- separada tramite_requisito para manejar listas estructuradas.
-- ============================================================
CREATE TABLE tramite (
    id           SERIAL PRIMARY KEY,
    nombre       VARCHAR(200) NOT NULL,
    requisitos   TEXT,                        -- lista en texto plano (limitación documentada)
    enlace       VARCHAR(500),                -- URL oficial del trámite
    id_categoria INT NOT NULL REFERENCES categoria(id),
    -- Campos adicionales declarados en el documento maestro
    pasos        TEXT,                        -- guía paso a paso (texto estructurado o JSON simple)
    tiempo_estimado VARCHAR(100)              -- ej: "3 a 5 días hábiles"
);


-- ============================================================
-- 5. PREGUNTA
-- CORRECCIÓN: tabla nueva para el módulo de cuestionarios.
-- Sin esto, las evaluaciones no tienen preguntas estructuradas.
-- ============================================================
CREATE TABLE pregunta (
    id           SERIAL PRIMARY KEY,
    id_categoria INT NOT NULL REFERENCES categoria(id),
    enunciado    TEXT NOT NULL,
    opcion_a     VARCHAR(300) NOT NULL,
    opcion_b     VARCHAR(300) NOT NULL,
    opcion_c     VARCHAR(300) NOT NULL,
    opcion_d     VARCHAR(300) NOT NULL,
    respuesta_correcta CHAR(1) CHECK (respuesta_correcta IN ('a','b','c','d')) NOT NULL
);


-- ============================================================
-- 6. EVALUACION
-- CORRECCIÓN: se agrega puntaje_maximo para contextualizar el puntaje
-- ============================================================
CREATE TABLE evaluacion (
    id              SERIAL PRIMARY KEY,
    id_usuario      UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    id_categoria    INT NOT NULL REFERENCES categoria(id),  -- evaluación por categoría
    puntaje         INT NOT NULL DEFAULT 0,
    puntaje_maximo  INT NOT NULL,                           -- ← CORRECCIÓN
    fecha           TIMESTAMPTZ DEFAULT NOW()
);


-- ============================================================
-- 7. REPORTE
-- CORRECCIÓN: se agrega campo fecha (estaba en el doc maestro, faltaba en el MER)
-- ============================================================
CREATE TABLE reporte (
    id           SERIAL PRIMARY KEY,
    id_usuario   UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    id_contenido INT NOT NULL REFERENCES contenido(id) ON DELETE CASCADE,
    problema     TEXT NOT NULL,
    estado       VARCHAR(20) CHECK (
        estado IN ('pendiente', 'en_revision', 'resuelto')
    ) DEFAULT 'pendiente',
    fecha        TIMESTAMPTZ DEFAULT NOW()                  -- ← CORRECCIÓN
);


-- ============================================================
-- ROW LEVEL SECURITY (RLS) — Supabase lo requiere
-- ============================================================

ALTER TABLE usuario    ENABLE ROW LEVEL SECURITY;
ALTER TABLE evaluacion ENABLE ROW LEVEL SECURITY;
ALTER TABLE reporte    ENABLE ROW LEVEL SECURITY;

-- Cada usuario solo ve y edita su propio perfil
CREATE POLICY "usuario_propio" ON usuario
    FOR ALL USING (auth.uid() = id);

-- Cada usuario solo ve sus propias evaluaciones
CREATE POLICY "evaluacion_propia" ON evaluacion
    FOR ALL USING (auth.uid() = id_usuario);

-- Cada usuario solo ve sus propios reportes
CREATE POLICY "reporte_propio" ON reporte
    FOR ALL USING (auth.uid() = id_usuario);

-- Contenido, categoría, trámite y preguntas son públicos (lectura)
ALTER TABLE categoria ENABLE ROW LEVEL SECURITY;
ALTER TABLE contenido ENABLE ROW LEVEL SECURITY;
ALTER TABLE tramite   ENABLE ROW LEVEL SECURITY;
ALTER TABLE pregunta  ENABLE ROW LEVEL SECURITY;

CREATE POLICY "lectura_publica_categoria" ON categoria FOR SELECT USING (true);
CREATE POLICY "lectura_publica_contenido" ON contenido FOR SELECT USING (true);
CREATE POLICY "lectura_publica_tramite"   ON tramite   FOR SELECT USING (true);
CREATE POLICY "lectura_publica_pregunta"  ON pregunta  FOR SELECT USING (true);


-- ============================================================
-- TRIGGER: actualizar fecha_actualizacion en contenido
-- ============================================================
CREATE OR REPLACE FUNCTION actualizar_fecha_actualizacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_contenido_actualizacion
    BEFORE UPDATE ON contenido
    FOR EACH ROW
    EXECUTE FUNCTION actualizar_fecha_actualizacion();

-- ============================================================
-- FIN DEL ESQUEMA
-- ============================================================