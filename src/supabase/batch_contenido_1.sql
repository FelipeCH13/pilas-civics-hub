-- ============================================================
-- PILAS CON EL DATO — Datos de prueba reales
-- Insertar en Supabase vía SQL Editor
-- Las categorías ya fueron insertadas con el esquema inicial
-- ============================================================

-- ============================================================
-- CONTENIDOS (9 artículos — 3 por categoría)
-- Categoría 1 = Educación Financiera
-- Categoría 2 = Trámites Administrativos
-- Categoría 3 = Movilidad Urbana
-- ============================================================

INSERT INTO contenido (titulo, cuerpo, id_categoria, nivel) VALUES

-- EDUCACIÓN FINANCIERA
(
  'Cómo crear tu primer presupuesto personal',
  'Un presupuesto personal es la herramienta más poderosa para controlar tu dinero. Consiste en registrar cuánto dinero entra (ingresos) y cuánto sale (gastos) en un período de tiempo, normalmente un mes.

**¿Por qué es importante?**
Sin un presupuesto, el dinero desaparece sin que sepas exactamente en qué lo gastaste. Con uno, tomas decisiones conscientes y puedes ahorrar aunque ganes poco.

**Cómo hacerlo en 4 pasos:**

1. **Calcula tus ingresos mensuales**: Incluye mesada, trabajos ocasionales, o cualquier dinero que recibas regularmente.

2. **Lista todos tus gastos**: Divide en fijos (transporte, alimentación, arriendo si aplica) y variables (salidas, entretenimiento, ropa).

3. **Aplica la regla 50-30-20**: Destina el 50% a necesidades básicas, el 30% a gustos personales y el 20% a ahorro.

4. **Registra y ajusta cada semana**: Usa una hoja de cálculo o una app gratuita como Wallet o Spendee.

**Ejemplo práctico:**
Si recibes $500.000 al mes:
- Necesidades: $250.000 (transporte, alimentación)
- Gustos: $150.000 (salidas, entretenimiento)
- Ahorro: $100.000

El ahorro, por pequeño que sea, debe ser lo primero que apartes, no lo que sobra al final del mes.',
  1, 'basico'
),

(
  'Qué es el crédito y cómo usarlo sin endeudarte',
  'El crédito es dinero que una entidad financiera te presta hoy con el compromiso de que lo devolverás en el futuro, con un costo adicional llamado interés. Saber usarlo bien puede abrirte puertas; usarlo mal puede atraparte en deudas difíciles de salir.

**Tipos de crédito más comunes en Colombia:**

- **Tarjeta de crédito**: Permite pagar compras y pagarlas al mes siguiente o en cuotas. Si pagas el total cada mes, no generas intereses. Si pagas el mínimo, los intereses se acumulan rápidamente.

- **Crédito de libre inversión**: Préstamo del banco para cualquier propósito, con cuotas fijas mensuales.

- **Crédito educativo ICETEX**: Préstamo del Estado para financiar estudios superiores, con tasas más bajas que los bancos comerciales.

**Conceptos clave que debes conocer:**

- **Tasa de interés**: El costo del préstamo, expresado como porcentaje. En Colombia, la tasa de usura (máximo legal) la fija la Superfinanciera cada trimestre.

- **Historia crediticia**: Registro de cómo has pagado tus deudas. Una buena historia te abre acceso a mejores créditos. Una mala te cierra puertas.

- **Centrales de riesgo (DataCrédito, TransUnion)**: Bases de datos donde queda registrado tu comportamiento financiero. Puedes consultar tu reporte gratuitamente una vez al mes.

**Regla de oro**: Nunca pidas prestado más de lo que puedes pagar con el 30% de tus ingresos mensuales.',
  1, 'intermedio'
),

(
  'Seguridad digital en transacciones financieras',
  'Cada vez más colombianos realizan pagos y transferencias desde el celular. Esto es conveniente, pero también atrae a personas que buscan robar tu dinero mediante engaños digitales llamados fraudes o estafas.

**Las modalidades de fraude más comunes en Colombia:**

- **Phishing**: Te llega un mensaje (email, WhatsApp o SMS) que parece de tu banco pidiéndote datos. Los bancos NUNCA te piden contraseñas por estos canales.

- **Vishing**: Una llamada telefónica donde alguien finge ser funcionario del banco o de una entidad del Estado para obtener tus datos.

- **SIM Swapping**: Los delincuentes convencen a tu operador móvil de transferir tu número a una SIM nueva, y así acceden a los códigos de verificación que llegan a tu celular.

- **Falsos QR**: Códigos QR pegados sobre los originales en establecimientos, que redirigen el pago a cuentas de terceros.

**Cómo protegerte:**

1. Nunca compartas tu contraseña, PIN o código OTP con nadie, ni aunque digan ser del banco.
2. Activa la autenticación en dos pasos en todas tus apps financieras.
3. Revisa el estado de tu cuenta al menos una vez por semana.
4. Si detectas un movimiento extraño, llama de inmediato a la línea oficial de tu banco (el número está en la parte trasera de tu tarjeta).
5. En Colombia puedes reportar fraudes financieros a la Superfinanciera: www.superfinanciera.gov.co

**Dato importante**: La Ley 1273 de 2009 tipifica los delitos informáticos en Colombia. Si eres víctima de fraude digital, puedes interponer denuncia ante la Fiscalía o la DIJIN.',
  1, 'avanzado'
),

-- TRÁMITES ADMINISTRATIVOS
(
  'Cómo sacar tu cédula de ciudadanía por primera vez',
  'La cédula de ciudadanía es el documento de identidad oficial de los colombianos mayores de 18 años. Sin ella no puedes votar, firmar contratos, abrir cuentas bancarias ni acceder a la mayoría de servicios del Estado.

**¿Cuándo debes tramitarla?**
A partir de los 17 años puedes iniciar el proceso para tenerla lista cuando cumplas 18.

**Requisitos:**
- Tarjeta de identidad original (la que tenías antes de los 18)
- Registro civil de nacimiento original
- Una foto reciente (en algunos casos la toman en el punto de atención)

**Paso a paso:**

1. **Agenda tu cita**: Ingresa a www.registraduria.gov.co y agenda una cita en la Registraduría más cercana a tu domicilio. También puedes ir sin cita, pero la espera puede ser larga.

2. **Asiste con los documentos**: Lleva los originales, no fotocopias. El funcionario tomará tus datos biométricos (huella dactilar y foto).

3. **Recibe el comprobante**: Te entregan un comprobante con el número de radicado para hacer seguimiento en línea.

4. **Recoge tu cédula**: El tiempo de entrega es de aproximadamente 15 días hábiles. Puedes recogerla en el punto donde la tramitaste o en cualquier Registraduría del país.

**Costo**: Gratuito para la primera expedición.

**Seguimiento**: www.registraduria.gov.co → "Consulta el estado de tu cédula"',
  2, 'basico'
),

(
  'Qué es el RUT y cómo inscribirte en la DIAN',
  'El RUT (Registro Único Tributario) es el documento que identifica a las personas y empresas ante la DIAN (Dirección de Impuestos y Aduanas Nacionales) para efectos fiscales en Colombia.

**¿Para qué necesitas el RUT?**
- Para trabajar como independiente (freelancer) y facturar tus servicios
- Para constituir una empresa o negocio
- Para importar o exportar mercancías
- Para acceder a algunos beneficios del Estado

**Si eres persona natural sin negocio**: Solo necesitas el RUT cuando vayas a realizar actividades económicas formales o cuando una empresa te lo exija para pagarte.

**Cómo inscribirte en el RUT — paso a paso:**

1. **En línea (recomendado)**: Ingresa a www.dian.gov.co → "Transaccional" → "Inscripción en el RUT". Necesitas cédula vigente y correo electrónico.

2. **Presencial**: Ve a cualquier punto de atención de la DIAN con tu cédula original. El trámite es gratuito.

3. **Completa la información**: Debes indicar tu actividad económica (código CIIU). Si vas a trabajar como independiente en tecnología, el código es 6201 (Actividades de desarrollo de sistemas).

4. **Descarga tu RUT**: Una vez inscrito, puedes descargar el documento en PDF desde el portal de la DIAN cuando lo necesites.

**Importante**: El RUT no vence, pero debes actualizarlo si cambian tus datos o actividad económica.

**Costo**: Totalmente gratuito.',
  2, 'intermedio'
),

(
  'Cómo interponer una PQR ante una entidad del Estado',
  'Una PQR es una Petición, Queja o Reclamo. Es el mecanismo legal que tienes como ciudadano para exigir que una entidad pública te responda, corrija un error o mejore un servicio. Está garantizado por la Ley 1437 de 2011 (Código de Procedimiento Administrativo).

**Diferencia entre los tres:**
- **Petición**: Solicitas información o un servicio. Ejemplo: pedir una certificación.
- **Queja**: Reportas una mala atención o irregularidad de un funcionario.
- **Reclamo**: Exiges que se corrija algo que te afectó directamente.

**Tiempos de respuesta que la ley garantiza:**
- Peticiones de información: **10 días hábiles**
- Peticiones de documentos: **3 días hábiles**
- Quejas y reclamos: **15 días hábiles**
- Si la entidad no responde en ese tiempo, puedes interponer una **acción de tutela** por violación al derecho de petición.

**Cómo presentar una PQR:**

1. **Identifica la entidad responsable**: La PQR debe ir dirigida a quien tiene la obligación de resolver tu caso.

2. **Elige el canal**: Puedes hacerlo presencialmente, por correo físico, por correo electrónico o a través del portal web de la entidad. La mayoría tiene formularios en línea.

3. **Incluye estos datos en tu escrito**:
   - Tu nombre completo y número de cédula
   - Dirección o correo electrónico para recibir respuesta
   - Descripción clara y específica de lo que solicitas o reclamas
   - Fecha y firma

4. **Guarda el radicado**: Siempre pide o anota el número de radicado — es tu prueba de que presentaste la PQR.

5. **Haz seguimiento**: Con el número de radicado puedes consultar el estado en el portal de la entidad.

**Consejo**: Si la entidad no responde en los tiempos legales, puedes presentar una acción de tutela ante cualquier juez del país, de forma gratuita y sin necesidad de abogado.',
  2, 'avanzado'
),

-- MOVILIDAD URBANA
(
  'Derechos y deberes básicos como peatón en Colombia',
  'En Colombia, el peatón es el actor vial más vulnerable y también el más protegido por la ley. El Código Nacional de Tránsito (Ley 769 de 2002) establece claramente qué puedes exigir y qué debes cumplir cuando te desplazas a pie por las ciudades.

**Tus derechos como peatón:**
- Cruzar en los cruces señalizados con prioridad sobre los vehículos
- Usar los andenes y zonas peatonales sin obstáculos
- Recibir atención médica inmediata si eres víctima de un accidente de tránsito, independientemente de quién tuvo la culpa
- Ser indemnizado si un vehículo te lesiona, a través del SOAT del vehículo involucrado

**Tus deberes como peatón:**
- Cruzar únicamente por los pasos peatonales o esquinas habilitadas
- Respetar los semáforos peatonales (luz roja = esperar, luz verde = cruzar)
- No usar el celular mientras cruzas una vía
- No caminar por la calzada (carril de vehículos) cuando hay andén disponible
- Obedecer las indicaciones de los agentes de tránsito

**Qué hacer si eres víctima de un accidente:**
1. Llama al 123 (línea de emergencias) o al 112
2. No muevas a la persona lesionada a menos que haya riesgo de incendio
3. Toma fotos del lugar, los vehículos involucrados y las placas
4. Exige que se levante un informe de tránsito

**Dato importante**: El SOAT (Seguro Obligatorio de Accidentes de Tránsito) cubre hasta $20 millones en gastos médicos para víctimas de accidentes de tránsito, incluyendo peatones, sin importar quién tuvo la culpa.',
  3, 'basico'
),

(
  'Cómo funciona el sistema de transporte público en Bogotá',
  'Bogotá tiene uno de los sistemas de transporte público más complejos de América Latina. Entender cómo funciona te ahorra dinero, tiempo y frustraciones.

**Los tres modos principales:**

**1. TransMilenio (BRT)**
Red de buses de alta capacidad que circulan por carriles exclusivos (troncales). Es el más rápido para distancias largas.
- Tarifa 2024: $3.100 (hora pico) / $2.850 (hora valle)
- Requiere tarjeta TuLlave recargable
- Cubre las principales avenidas de la ciudad

**2. SITP (Sistema Integrado de Transporte Público)**
Buses convencionales que cubren los barrios donde no llega TransMilenio.
- Misma tarifa que TransMilenio
- Puedes hacer transbordo entre SITP y TransMilenio sin costo adicional dentro de los 75 minutos siguientes al primer viaje
- Se paga con la misma tarjeta TuLlave

**3. Metro de Bogotá**
Primera línea en construcción (apertura proyectada 2028). Correrá desde el Portal Américas hasta la calle 127.

**La tarjeta TuLlave:**
- Se adquiere en cualquier estación de TransMilenio o puntos autorizados
- Costo de la tarjeta: $7.000 (no reembolsable)
- Se recarga en estaciones, supermercados y apps como Nequi o Daviplata
- Puedes registrarla en www.tullave.com.co para bloquearla en caso de robo

**Consejos prácticos:**
- Descarga la app "Moovit" o "Google Maps" para planear rutas en tiempo real
- Los buses SITP tienen número de ruta en la parte frontal — consulta en tu app la ruta más conveniente
- En horas pico (6-9am y 5-8pm) el sistema está saturado — si puedes, viaja fuera de esos horarios',
  3, 'intermedio'
),

(
  'Infracciones de tránsito más comunes y cómo evitarlas',
  'En Colombia, las infracciones de tránsito generan multas que pueden afectar significativamente tu bolsillo. El Código Nacional de Tránsito clasifica las infracciones en categorías según su gravedad, y las multas se expresan en SMLDV (Salario Mínimo Legal Diario Vigente).

**Las infracciones más frecuentes y sus costos (2024):**

| Infracción | Multa aproximada |
|---|---|
| No usar cinturón de seguridad | 4 SMLDV (~$160.000) |
| Usar el celular mientras conduce | 8 SMLDV (~$320.000) |
| Estacionar en zona prohibida | 4 SMLDV (~$160.000) |
| Conducir sin SOAT | 30 SMLDV (~$1.200.000) |
| Conducir sin licencia | 15 SMLDV (~$600.000) |
| Pasarse un semáforo en rojo | 15 SMLDV (~$600.000) |
| Conducir en estado de embriaguez | 360 SMLDV + inmovilización + suspensión de licencia |

**¿Qué pasa si te imponen una multa?**

1. El agente te entrega un comparendo (documento oficial de la infracción)
2. Tienes **5 días hábiles** para pagar con descuento del 50% si aceptas la infracción
3. Si no estás de acuerdo, puedes impugnar el comparendo ante el organismo de tránsito correspondiente
4. Si no pagas, la deuda queda en tu historial y puede impedir la renovación de tu licencia o la venta de tu vehículo

**Cómo consultar si tienes comparendos:**
- En Bogotá: www.transitobogota.gov.co
- A nivel nacional: www.runt.com.co (Registro Único Nacional de Tránsito)

**Importante para ciclistas**: En Colombia los ciclistas también están sujetos al Código de Tránsito. Deben respetar semáforos, usar chaleco reflectivo en la noche y no circular por andenes.',
  3, 'avanzado'
);


-- ============================================================
-- TRÁMITES (6 — 2 por categoría)
-- ============================================================

INSERT INTO tramite (nombre, requisitos, enlace, id_categoria, pasos, tiempo_estimado) VALUES

-- EDUCACIÓN FINANCIERA
(
  'Apertura de cuenta de ahorros en banco digital',
  '- Cédula de ciudadanía vigente
- Número de celular activo a tu nombre
- Correo electrónico personal
- Selfie reciente (algunos bancos la solicitan durante el proceso)',
  'https://www.superfinanciera.gov.co',
  1,
  '1. Descarga la app del banco digital de tu elección (Nequi, Daviplata, Lulo Bank, Nubank Colombia).
2. Abre la app y selecciona "Crear cuenta" o "Regístrate".
3. Ingresa tu número de cédula y datos personales básicos.
4. Toma una foto de tu cédula (frente y reverso) cuando la app lo solicite.
5. Realiza la verificación de identidad (selfie o video corto).
6. Crea tu clave o PIN de seguridad.
7. Acepta los términos y condiciones.
8. Tu cuenta queda activa de inmediato — recibirás confirmación por SMS y correo.',
  'Inmediato (proceso 100% digital, menos de 10 minutos)'
),

(
  'Consulta de reporte en centrales de riesgo (DataCrédito)',
  '- Cédula de ciudadanía
- Correo electrónico
- Número de celular',
  'https://www.midatacredito.com',
  1,
  '1. Ingresa a www.midatacredito.com
2. Selecciona "Consulta gratuita" o "Regístrate".
3. Crea una cuenta con tu correo y número de cédula.
4. Verifica tu identidad respondiendo preguntas de seguridad sobre tu historial.
5. Accede a tu reporte de crédito completo en formato PDF.
6. Revisa el estado de cada obligación: al día, en mora, o castigada.
7. Si encuentras información incorrecta, usa el botón "Radicar solicitud de corrección".',
  'Inmediato (consulta gratuita una vez al mes)'
),

-- TRÁMITES ADMINISTRATIVOS
(
  'Inscripción al RUT como persona natural ante la DIAN',
  '- Cédula de ciudadanía original y vigente
- Correo electrónico personal
- Número de celular
- Dirección de residencia actual',
  'https://www.dian.gov.co',
  2,
  '1. Ingresa a www.dian.gov.co y selecciona "Transaccional".
2. Haz clic en "Inscripción en el RUT".
3. Selecciona "Persona Natural" y acepta los términos.
4. Ingresa tu número de cédula y los datos del formulario (nombre, dirección, actividad económica).
5. Selecciona el código CIIU que corresponde a tu actividad principal.
6. Revisa el borrador del formulario y confirma los datos.
7. El sistema genera tu RUT en formato PDF de inmediato.
8. Descarga y guarda el PDF — es tu documento oficial ante la DIAN.',
  'Inmediato en línea / 1 día hábil presencial'
),

(
  'Solicitud de certificado de residencia ante el municipio',
  '- Cédula de ciudadanía
- Recibo de servicios públicos (agua, luz o gas) a tu nombre o del titular del inmueble
- En algunos municipios: carta del arrendador o propietario si no eres el titular de los servicios',
  'https://www.gov.co',
  2,
  '1. Identifica la secretaría de tu municipio que expide este certificado (generalmente la Secretaría de Gobierno o la Personería).
2. Verifica si tu municipio permite el trámite en línea en www.gov.co o en el portal del municipio.
3. Si es presencial: ve con los documentos requeridos al punto de atención.
4. Llena el formulario de solicitud con tus datos y dirección de residencia.
5. Entrega los documentos soporte al funcionario.
6. Recibe el certificado firmado y sellado — en muchos municipios se entrega el mismo día.',
  '1 a 3 días hábiles (varía según el municipio)'
),

-- MOVILIDAD URBANA
(
  'Obtención de licencia de conducción por primera vez',
  '- Cédula de ciudadanía vigente
- Certificado de aptitud física, mental y de coordinación motriz (expedido por un centro médico habilitado)
- Certificado de aprendizaje de normas de tránsito (expedido por una escuela de conducción registrada ante el RUNT)
- Pago de derechos según la categoría solicitada',
  'https://www.runt.com.co',
  3,
  '1. Toma el curso teórico-práctico en una escuela de conducción registrada ante el RUNT. La duración mínima varía según la categoría (moto, carro, etc.).
2. Obtén el certificado de aptitud física en un centro médico habilitado (incluye examen de visión, coordinación y psicomotricidad).
3. Aprueba el examen teórico de normas de tránsito en el organismo de tránsito de tu ciudad.
4. Aprueba el examen práctico de conducción.
5. Paga los derechos de expedición en el organismo de tránsito.
6. El organismo de tránsito genera tu licencia en el sistema RUNT.
7. Recoge tu licencia física o descárgala digitalmente desde www.runt.com.co.',
  '15 a 30 días hábiles (dependiendo de disponibilidad de cupos en exámenes)'
),

(
  'Pago y consulta de infracciones de tránsito en Bogotá',
  '- Número de placa del vehículo o número de cédula del infractor
- Medio de pago (tarjeta débito/crédito o efectivo en puntos autorizados)',
  'https://www.transitobogota.gov.co',
  3,
  '1. Ingresa a www.transitobogota.gov.co y selecciona "Consulta de infracciones".
2. Ingresa el número de cédula o la placa del vehículo.
3. El sistema muestra las infracciones activas con fecha, lugar y valor de la multa.
4. Selecciona la infracción que deseas pagar.
5. Si pagas dentro de los 5 días hábiles siguientes a la imposición, aplica descuento del 50%.
6. Selecciona el método de pago (PSE, tarjeta de crédito, o genera el código de pago para efectivo).
7. Guarda el comprobante de pago — es tu soporte ante cualquier requerimiento futuro.',
  'Inmediato (pago en línea disponible 24/7)'
);


-- ============================================================
-- PREGUNTAS (9 — 3 por categoría)
-- ============================================================

INSERT INTO pregunta (id_categoria, enunciado, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta) VALUES

-- EDUCACIÓN FINANCIERA
(
  1,
  'Según la regla 50-30-20, ¿qué porcentaje de tus ingresos deberías destinar al ahorro?',
  '10%',
  '20%',
  '30%',
  '50%',
  'b'
),
(
  1,
  '¿Cuál de las siguientes opciones describe correctamente el phishing?',
  'Un tipo de inversión de alto riesgo en bolsa de valores',
  'Un fraude donde te contactan fingiendo ser tu banco para robarte datos',
  'Un servicio financiero para personas sin historial crediticio',
  'Una modalidad de ahorro programado en bancos digitales',
  'b'
),
(
  1,
  '¿Qué entidad en Colombia fija la tasa de usura (máximo interés legal)?',
  'El Banco de la República',
  'El Ministerio de Hacienda',
  'La Superintendencia Financiera de Colombia',
  'La DIAN',
  'c'
),

-- TRÁMITES ADMINISTRATIVOS
(
  2,
  '¿Cuántos días hábiles tiene una entidad del Estado para responder una petición de información según la ley colombiana?',
  '5 días hábiles',
  '10 días hábiles',
  '15 días hábiles',
  '30 días hábiles',
  'b'
),
(
  2,
  '¿Cuál es el costo de inscribirse en el RUT ante la DIAN por primera vez?',
  '$50.000',
  '$15.000',
  '$100.000',
  'Es gratuito',
  'd'
),
(
  2,
  'Si una entidad del Estado no responde tu derecho de petición en el tiempo legal, ¿qué acción puedes interponer?',
  'Una demanda civil ante un juzgado',
  'Una queja ante la Personería Municipal',
  'Una acción de tutela por violación al derecho de petición',
  'Un recurso de apelación ante el Ministerio del Interior',
  'c'
),

-- MOVILIDAD URBANA
(
  3,
  '¿Cuál es la multa aproximada por usar el celular mientras se conduce en Colombia?',
  '4 SMLDV',
  '15 SMLDV',
  '8 SMLDV',
  '30 SMLDV',
  'c'
),
(
  3,
  'En Bogotá, ¿cuánto tiempo tienes para hacer un transbordo gratuito entre el SITP y TransMilenio?',
  '30 minutos',
  '45 minutos',
  '75 minutos',
  '90 minutos',
  'c'
),
(
  3,
  '¿Qué cubre el SOAT para un peatón víctima de un accidente de tránsito en Colombia?',
  'Solo cubre a los ocupantes del vehículo, no a peatones',
  'Cubre gastos médicos hasta $20 millones, independientemente de quién tuvo la culpa',
  'Cubre únicamente los daños materiales del vehículo',
  'Solo cubre si el peatón tenía seguro médico previo',
  'b'
);

-- ============================================================
-- FIN DE LOS DATOS
-- ============================================================