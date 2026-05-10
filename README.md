# 🧠 Pilas con el Dato

> Plataforma web de alfabetización ciudadana para estudiantes de educación media en Colombia — centraliza información verificada sobre educación financiera, trámites administrativos y movilidad urbana.

---

## 🗂️ Tabla de Contenidos
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Funcionalidades](#funcionalidades)
- [Stack Tecnológico](#stack-tecnológico)
- [Arquitectura](#arquitectura)
- [Base de Datos](#base-de-datos)
- [Cómo Ejecutar](#cómo-ejecutar)
- [Equipo](#equipo)
- [Referencias](#referencias)

---

## 📌 Descripción del Proyecto

**Pilas con el Dato** es una plataforma digital educativa desarrollada como proyecto de grado del programa de Ingeniería de Sistemas de la UNAD. Surge para mitigar la brecha informativa que enfrentan los jóvenes colombianos al finalizar la educación media sin competencias prácticas para navegar el sistema ciudadano, financiero y legal del país.

La plataforma funciona como una *biblioteca para la vida*: centraliza contenidos verificados, guías de trámites paso a paso y cuestionarios de autoevaluación organizados en tres ejes temáticos:

- 💰 **Educación financiera** — ahorro, crédito, billeteras digitales, seguridad en transacciones
- 📋 **Trámites administrativos** — RUT, cédula, PQR, SISBÉN, pasaporte
- 🚦 **Movilidad urbana** — normas de tránsito, SOAT, derechos del peatón y el ciclista

El prototipo alcanza un nivel de maduración tecnológica **TRL5** según los criterios de Colciencias: opera con datos reales, usuarios reales y en infraestructura en la nube.

---

## ✅ Funcionalidades

| Módulo | Descripción |
|--------|-------------|
| Autenticación | Registro e inicio de sesión con email y contraseña vía Supabase Auth |
| Categorías | Pantalla de inicio con las 3 categorías temáticas |
| Contenidos | Artículos por categoría con niveles básico, intermedio y avanzado |
| Trámites | Guías paso a paso con requisitos, tiempos y enlace oficial |
| Buscador | Búsqueda por palabra clave sobre contenidos y trámites |
| Cuestionarios | Evaluación de conocimiento con puntaje y retroalimentación |
| Perfil | Panel de progreso por categoría y historial de evaluaciones |
| Reportes | Formulario para reportar contenido desactualizado |

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología |
|------|------------|
| Frontend | [Lovable](https://lovable.dev) — generación de interfaces asistida por IA |
| Backend / Auth | [Supabase](https://supabase.com) — BaaS con PostgreSQL, API REST y Row Level Security |
| Base de datos | PostgreSQL (administrado en Supabase Cloud) |
| Control de versiones | GitHub |
| Metodología | Scrum (3 sprints) |

---

## 🏗️ Arquitectura

El sistema sigue una arquitectura de tres capas:

```
┌─────────────────────────────────────┐
│     Capa de presentación            │
│     Lovable · React · Mobile First  │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│     Capa de lógica de negocio       │
│     Supabase BaaS · API REST        │
│     Autenticación JWT · RLS         │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│     Capa de datos                   │
│     PostgreSQL · Supabase Cloud     │
│     Cumplimiento Ley 1581/2012      │
└─────────────────────────────────────┘
```

---

## 🗄️ Base de Datos

El esquema cuenta con 7 entidades normalizadas hasta la tercera forma normal:

```
usuario        — perfil del usuario autenticado (vinculado a Supabase Auth)
categoria      — las 3 categorías temáticas de la plataforma
contenido      — artículos por categoría con cuerpo en Markdown
tramite        — guías de trámites con pasos y enlace oficial
pregunta       — banco de preguntas por categoría para cuestionarios
evaluacion     — resultados de cuestionarios por usuario y categoría
reporte        — reportes de contenido desactualizado enviados por usuarios
```

El archivo SQL completo con el esquema y los datos iniciales está en:
```
/supabase/schema.sql
/supabase/seed.sql
```

---

## ⚙️ Cómo Ejecutar

### Requisitos
- Cuenta en [Supabase](https://supabase.com) (tier gratuito es suficiente)
- Cuenta en [Lovable](https://lovable.dev) (para modificar el frontend)
- Node.js 18+

### Pasos

1. Clona el repositorio:
```bash
git clone https://github.com/TU_USUARIO/pilas-con-el-dato.git
cd pilas-con-el-dato
```

2. Instala dependencias:
```bash
npm install
```

3. Crea un proyecto en Supabase y ejecuta el esquema:
```bash
# En el SQL Editor de Supabase, ejecuta:
# supabase/schema.sql  → crea las tablas
# supabase/seed.sql    → carga los datos iniciales
```

4. Configura las variables de entorno:
```bash
cp .env.example .env
# Agrega tu SUPABASE_URL y SUPABASE_ANON_KEY
```

5. Corre el proyecto:
```bash
npm run dev
```

---

## 👥 Equipo

| Nombre | Rol |
|--------|-----|
| Ivan Felipe Chavez Cortes | Scrum Master · Desarrollo del prototipo |
| Wilson Acosta Diaz | Product Owner · Documentación |

Proyecto de Grado — Ingeniería de Sistemas  
Universidad Nacional Abierta y a Distancia (UNAD)  
Código del curso: 202016907 · 2026

---

## 🔗 Referencias

- [Supabase Documentation](https://supabase.com/docs)
- [Lovable Documentation](https://docs.lovable.dev)
- [Colciencias — Niveles TRL](https://minciencias.gov.co)
- [Superfinanciera de Colombia](https://www.superfinanciera.gov.co)
- [DIAN — Portal de trámites](https://www.dian.gov.co)
- [RUNT — Registro Único Nacional de Tránsito](https://www.runt.com.co)
- [Registraduría Nacional](https://www.registraduria.gov.co)

---

*Desarrollado por Ivan Felipe Chavez Cortes & Wilson Acosta Diaz — 2026*
