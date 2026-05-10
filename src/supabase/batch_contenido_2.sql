-- ============================================================
-- PILAS CON EL DATO — Datos adicionales v2
-- Insertar en Supabase vía SQL Editor
-- ============================================================
-- CONTENIDOS adicionales: 12 nuevos (4 por categoría)
-- TRÁMITES adicionales: 6 nuevos (2 por categoría)
-- PREGUNTAS adicionales: 9 nuevas (3 por categoría)
-- ============================================================


-- ============================================================
-- CONTENIDOS ADICIONALES
-- ============================================================

INSERT INTO contenido (titulo, cuerpo, id_categoria, nivel) VALUES

-- ─── EDUCACIÓN FINANCIERA ───────────────────────────────────

(
  'Qué es Nequi, Daviplata y las billeteras digitales',
  'Las billeteras digitales son aplicaciones que te permiten guardar, enviar y recibir dinero desde tu celular, sin necesidad de ir a un banco. En Colombia son gratuitas, fáciles de abrir y están reguladas por la Superintendencia Financiera.

**Las más usadas en Colombia:**

**Nequi (Bancolombia)**
- Apertura 100% digital en minutos
- Transferencias gratuitas entre usuarios Nequi
- Permite crear "bolsillos" para ahorrar por metas (vacaciones, ropa, emergencias)
- Recarga en Éxito, Carulla, Bancolombia y corresponsales bancarios
- Límite diario de transacciones: $3.000.000

**Daviplata (Davivienda)**
- Funciona con cualquier operador móvil, incluso sin datos — solo con minutos
- Disponible para personas sin cuenta bancaria
- Se recarga en tiendas de barrio autorizadas
- Integrada con el sistema de subsidios del Estado (Familias en Acción, Ingreso Solidario)

**Movii**
- Permite recibir pagos de plataformas internacionales
- Útil para freelancers que cobran en dólares y convierten a pesos

**¿Cuál elegir?**
Si tienes cuenta en Bancolombia: Nequi es la más conveniente.
Si no tienes cuenta bancaria: Daviplata es la más accesible.
Si trabajas con clientes internacionales: Movii complementa bien.

**Importante:** Las billeteras digitales no son cuentas de ahorro tradicionales. No generan intereses ni están cubiertas por el Fogafín (seguro de depósitos bancarios). Úsalas para transacciones del día a día, no para guardar grandes sumas.',
  1, 'basico'
),

(
  'Cómo ahorrar siendo estudiante: estrategias reales',
  'Ahorrar con ingresos bajos o irregulares parece imposible, pero es una habilidad que se aprende y se entrena. Estas estrategias han sido validadas por expertos en finanzas personales y funcionan incluso con mesadas pequeñas.

**1. El ahorro automático — lo más efectivo**
Configura una transferencia automática el mismo día que recibes tu dinero. Así ahorras antes de gastar, no con lo que sobra. Nequi y Daviplata permiten hacerlo gratis con la función de bolsillos o ahorro programado.

**2. El método de los sobres (versión digital)**
Divide tu dinero en categorías al recibirlo: transporte, alimentación, entretenimiento, ahorro. Lo que va al sobre de ahorro no se toca. Si usas Nequi, cada bolsillo es un sobre virtual.

**3. La regla del 24 horas**
Antes de comprar algo que no planificaste, espera 24 horas. La mayoría de las veces el impulso desaparece. Esta regla evita compras emocionales que dañan el presupuesto.

**4. Rastrea cada gasto durante 30 días**
No para juzgarte, sino para conocerte. La mayoría de las personas descubren gastos hormiga que no recordaban: apps suscritas sin usar, domicilios frecuentes, recargas de datos innecesarias.

**5. El ahorro de monedas digitales**
Algunas apps redondean tus compras al peso más cercano y guardan la diferencia. Es poco dinero, pero crea el hábito sin que lo sientas.

**Meta realista para empezar:**
Ahorra el 10% de lo que recibes durante 3 meses seguidos. No importa si son $20.000 o $200.000 — el hábito vale más que la cantidad al inicio.

**Dato motivador:** $5.000 diarios ahorrados durante un año = $1.825.000. Eso es un semestre universitario en muchas instituciones públicas.',
  1, 'basico'
),

(
  'Entendiendo los impuestos en Colombia: lo básico',
  'Los impuestos son la forma en que los ciudadanos financian colectivamente los servicios del Estado: hospitales, colegios, carreteras, policía, justicia. En Colombia el sistema tributario tiene varios niveles y tipos que todo ciudadano debería conocer básicamente.

**Los impuestos más importantes para un joven:**

**IVA (Impuesto al Valor Agregado)**
Es el impuesto que pagas cada vez que compras algo. La tarifa general en Colombia es del 19%. Ya está incluido en el precio que ves en las etiquetas.
- Exentos de IVA: canasta familiar básica (arroz, papa, leche, carne, huevos), libros, cuadernos, medicamentos.
- Con IVA del 5%: algunos alimentos procesados, servicios de telefonía.

**Renta (Impuesto sobre la Renta)**
Lo pagan personas y empresas sobre sus ingresos anuales. Si trabajas como empleado formal con salario, tu empleador lo descuenta directamente (retención en la fuente). Si trabajas como independiente, eres tú quien debe declarar.
- Las personas naturales que ganen menos de ~$59.000.000 al año no están obligadas a declarar renta.

**ICA (Impuesto de Industria y Comercio)**
Es un impuesto municipal que pagan los negocios. Si tienes un emprendimiento formal, debes pagarlo al municipio donde operas.

**¿Por qué importa entender los impuestos?**
Porque cuando trabajas formalmente, estos descuentos aparecen en tu colilla de pago. Si los desconoces, no sabes si te están cobrando correctamente. Y cuando emprendas, ignorar tus obligaciones tributarias puede generarte sanciones de la DIAN.',
  1, 'intermedio'
),

(
  'Qué es el Fogafín y cómo protege tu dinero',
  'El Fogafín (Fondo de Garantías de Instituciones Financieras) es una entidad del Estado colombiano que protege los depósitos de los ahorradores en caso de que un banco o cooperativa financiera quiebre o entre en liquidación.

**¿Cuánto protege el Fogafín?**
Cubre hasta **50 millones de pesos por persona por entidad**. Esto significa que si tienes $50 millones en Bancolombia y el banco quiebra (hipotéticamente), el Estado te devuelve ese dinero. Si tienes $80 millones, solo recuperas $50 millones.

**¿Qué productos cubre?**
- Cuentas de ahorro ✅
- Cuentas corrientes ✅
- CDT (Certificados de Depósito a Término) ✅
- Depósitos electrónicos de algunos bancos ✅

**¿Qué NO cubre?**
- Inversiones en bolsa de valores ❌
- Criptomonedas ❌
- Billeteras digitales como Nequi o Daviplata (en su modalidad básica) ❌
- Cooperativas no vigiladas por la Superfinanciera ❌

**¿Por qué importa esto?**
En Colombia han ocurrido casos de captadoras ilegales (pirámides) que prometían rendimientos altísimos y luego desaparecieron con el dinero de miles de personas. Una señal de alerta es cuando alguien te ofrece rendimientos muy superiores al mercado (más del 2-3% mensual). Si la entidad no está vigilada por la Superfinanciera y no tiene cobertura del Fogafín, tu dinero no tiene respaldo legal.',
  1, 'avanzado'
),


-- ─── TRÁMITES ADMINISTRATIVOS ────────────────────────────────

(
  'Cómo sacar tu tarjeta de identidad (menores de 18)',
  'La tarjeta de identidad es el documento oficial de identificación para los colombianos entre 7 y 17 años. Sin ella no puedes matricularte en instituciones educativas, acceder a servicios de salud con el SISBÉN, ni realizar trámites básicos ante el Estado.

**¿Cuándo debes tramitarla?**
- Primera vez: desde los 7 años (obligatoria para el sistema escolar)
- Renovación: cuando cumples 14 años (cambio de formato)
- Al cumplir 18: se reemplaza automáticamente por la cédula de ciudadanía

**Requisitos:**
- Registro civil de nacimiento original (el que tienen tus papás desde que naciste)
- Si ya tenías tarjeta anterior: llevarla también
- Acompañante mayor de edad con cédula (si eres menor de 14)

**Paso a paso:**
1. Ve a la Registraduría Nacional más cercana a tu domicilio. No necesitas cita previa para este trámite, pero puedes agendarla en www.registraduria.gov.co para evitar filas.
2. Entrega el registro civil original al funcionario.
3. El funcionario capturará tu foto, huella dactilar e información personal.
4. Recibes un comprobante con número de radicado para seguimiento.
5. En aproximadamente 15 días hábiles tu tarjeta está lista para recoger.

**Costo:** Gratuito para la primera expedición.

**Consejo:** Guarda siempre el registro civil original — es el documento raíz de tu identidad. Sin él, cualquier trámite de identificación se complica.',
  2, 'basico'
),

(
  'Cómo afiliarte al sistema de salud en Colombia',
  'En Colombia, el sistema de salud funciona a través de dos regímenes: el contributivo (para quienes trabajan formalmente) y el subsidiado (para quienes no tienen capacidad de pago). Conocer cómo funciona y cómo afiliarte es fundamental para acceder a atención médica cuando la necesites.

**Régimen Subsidiado — SISBÉN**
Si no tienes trabajo formal ni ingresos estables, puedes acceder al sistema de salud a través del SISBÉN (Sistema de Identificación de Potenciales Beneficiarios).

Cómo funciona:
1. El municipio realiza una encuesta en tu hogar para determinar tu nivel socioeconómico (puntaje SISBÉN).
2. Según ese puntaje, puedes ser beneficiario de salud subsidiada a través de una EPS pública.
3. La afiliación al régimen subsidiado se gestiona en la Secretaría de Salud de tu municipio.

**Régimen Contributivo — cuando trabajas**
Cuando tengas un trabajo formal con contrato, tu empleador te afiliará a una EPS de tu elección y descontará de tu salario el aporte correspondiente (aproximadamente 4% del salario, el empleador paga el resto).

**Si eres estudiante universitario:**
Muchas universidades tienen convenios con EPS o pólizas de accidente estudiantil. Consulta con tu institución.

**EPS principales en Colombia:**
Sura, Sanitas, Nueva EPS (pública), Compensar, Famisanar, Salud Total.

**Derecho fundamental:** En Colombia la salud de urgencias no puede negarse a ningún ciudadano, aunque no esté afiliado a ningún régimen. Si llegas a urgencias, deben atenderte.',
  2, 'intermedio'
),

(
  'Cómo presentar una denuncia ante la Fiscalía en Colombia',
  'Interponer una denuncia penal es un derecho ciudadano y en muchos casos una obligación moral cuando se es víctima o testigo de un delito. En Colombia, la Fiscalía General de la Nación es la entidad encargada de investigar y acusar a los responsables de delitos.

**¿Cuándo debes denunciar?**
Cuando seas víctima o testigo de: robo, hurto, fraude, violencia física, acoso, amenazas, extorsión, delitos informáticos, o cualquier conducta tipificada como delito en el Código Penal colombiano.

**Canales para denunciar:**

1. **En línea (más fácil):** www.fiscalia.gov.co → "Denuncia en línea". Disponible 24/7, no requiere desplazamiento.

2. **Presencial:** En cualquier URI (Unidad de Reacción Inmediata) de la Fiscalía o en las estaciones de Policía. Llevar cédula y toda la información disponible del hecho.

3. **Línea 122:** Línea gratuita de la Fiscalía para denuncias. Disponible las 24 horas.

**Qué necesitas tener claro al denunciar:**
- Fecha, hora y lugar del hecho
- Descripción detallada de lo ocurrido
- Datos del presunto responsable si los conoces
- Evidencias: capturas de pantalla, fotos, testigos, documentos

**¿Necesitas abogado para denunciar?**
No. Cualquier ciudadano puede interponer una denuncia directamente, sin representación legal.

**¿Qué pasa después?**
La Fiscalía asigna un fiscal al caso y realiza las investigaciones. Recibirás un número de radicado para hacer seguimiento. El proceso puede tomar meses o años dependiendo de la complejidad del caso.

**Importante:** Denunciar con información falsa es un delito (falsa denuncia). Asegúrate de relatar solo lo que sabes con certeza.',
  2, 'avanzado'
),

(
  'Qué es el SISBÉN y cómo consultar tu puntaje',
  'El SISBÉN (Sistema de Identificación de Potenciales Beneficiarios de Programas Sociales) es la herramienta del Estado colombiano para identificar a las familias más vulnerables y priorizarlas en programas de apoyo como salud subsidiada, subsidios de vivienda, Familias en Acción, Jóvenes en Acción, y becas del ICETEX.

**¿Cómo se calcula el puntaje SISBÉN?**
A través de una encuesta que evalúa: condiciones de la vivienda, acceso a servicios públicos, nivel educativo del hogar, ingresos familiares y bienes del hogar. El resultado es un puntaje que determina a cuáles programas puedes acceder.

**Los grupos del SISBÉN IV (versión actual):**
- **Grupo A (A1-A5):** Pobreza extrema — acceso a la mayoría de subsidios
- **Grupo B (B1-B7):** Pobreza moderada — acceso a salud subsidiada y algunos subsidios
- **Grupo C (C1-C18):** Vulnerabilidad — acceso a programas específicos
- **Grupo D (D1-D21):** Sin vulnerabilidad crítica — acceso limitado

**Cómo consultar tu puntaje:**
1. Ingresa a www.sisben.gov.co
2. Selecciona "Consulta tu puntaje"
3. Ingresa tu número de cédula o tarjeta de identidad
4. El sistema muestra tu grupo, puntaje y los programas a los que podrías acceder

**Si no estás en el SISBÉN:**
Dirígete a la Secretaría de Planeación o de Desarrollo Social de tu municipio y solicita la inclusión. Llevar: cédula, recibos de servicios públicos y documentos del hogar.

**Dato importante para estudiantes:** El puntaje SISBÉN es requisito para acceder a becas del Ministerio de Educación, créditos del ICETEX con subsidio del Estado y el programa Jóvenes en Acción del SENA.',
  2, 'basico'
),


-- ─── MOVILIDAD URBANA ────────────────────────────────────────

(
  'Derechos y deberes del ciclista en Colombia',
  'En Colombia, la bicicleta es reconocida como un medio de transporte legítimo con los mismos derechos que otros vehículos en la vía. La Ley 1811 de 2016 y el Código Nacional de Tránsito establecen un marco claro de protección para los ciclistas.

**Tus derechos como ciclista:**
- Circular por la calzada vehicular cuando no haya ciclovía disponible
- Ser respetado por los vehículos motorizados, quienes deben guardar una distancia lateral mínima de 1 metro al adelantarlos
- Usar las ciclovías y ciclorrutas sin obstáculos ni peatones en ellas
- Recibir atención médica inmediata en caso de accidente, cubierta por el SOAT del vehículo involucrado
- En Bogotá: 10 días de licencia remunerada al año si vas en bici al trabajo (Ley 1811)

**Tus deberes como ciclista:**
- Respetar semáforos y señales de tránsito — aplican igual que para vehículos
- Usar chaleco o elementos reflectivos entre las 6:00 pm y las 6:00 am
- Llevar timbre o campana funcional
- No usar el celular mientras pedaleas
- No transportar pasajeros adicionales salvo en sillas homologadas para niños
- No circular por andenes — el andén es exclusivo para peatones

**Infracciones frecuentes del ciclista y sus multas:**
- Circular en sentido contrario: 4 SMLDV (~$160.000)
- No usar elementos reflectivos de noche: 4 SMLDV
- Pasarse un semáforo en rojo: 15 SMLDV (~$600.000)

**Consejo de seguridad:** Más del 70% de los accidentes fatales de ciclistas en Colombia ocurren en la noche. Si ruedas de noche, el chaleco reflectivo no es opcional — es la diferencia entre que te vean o no.',
  3, 'basico'
),

(
  'Cómo funciona el SOAT y qué hacer en un accidente de tránsito',
  'El SOAT (Seguro Obligatorio de Accidentes de Tránsito) es un seguro que debe tener todo vehículo que circule en Colombia. No cubre daños materiales — cubre exclusivamente a las personas que resulten heridas en un accidente, sin importar quién tuvo la culpa.

**¿Qué cubre el SOAT?**
- Gastos médicos: hasta $20.625.000 por persona
- Incapacidad permanente: hasta $27.500.000
- Muerte: hasta $27.500.000 para los beneficiarios
- Gastos funerarios: hasta $2.750.000

**¿Quiénes pueden usar el SOAT?**
Cualquier víctima del accidente: conductor, pasajeros, peatones, ciclistas. No se requiere demostrar quién fue el culpable.

**Qué hacer si estás en un accidente de tránsito:**

1. **Llama al 123** (emergencias) para ambulancia si hay heridos.
2. **No muevas a los heridos** a menos que haya peligro inminente (incendio, riesgo de hundimiento).
3. **Señaliza el área** para evitar nuevos accidentes — triángulos de carretera o luces de emergencia.
4. **Llama a la Policía de Tránsito** para que levante el informe oficial del accidente. Sin ese informe, el proceso de reclamación al SOAT se complica.
5. **Toma fotos** del lugar, los vehículos, las placas y las lesiones visibles.
6. **Solicita el SOAT** al propietario del vehículo involucrado o consúltalo en www.runt.com.co con la placa.

**Cómo reclamar el SOAT:**
Dirígete a cualquier clínica u hospital con convenio SOAT. Ellos facturan directamente a la aseguradora. Como víctima, no pagas de tu bolsillo los gastos médicos cubiertos.

**Si el vehículo no tiene SOAT:**
El FONSAT (Fondo de Seguro Obligatorio de Accidentes de Tránsito) cubre a las víctimas de accidentes causados por vehículos sin SOAT o no identificados. Se reclama ante la Superintendencia Financiera.',
  3, 'intermedio'
),

(
  'Transporte público en Colombia: tus derechos como pasajero',
  'Como usuario del transporte público en Colombia, tienes derechos específicos que las empresas de transporte están obligadas a respetar. Conocerlos te permite exigir un servicio digno y tomar acción cuando no se cumplan.

**Tus derechos fundamentales como pasajero:**

**1. Derecho a la seguridad**
El vehículo debe estar en condiciones técnico-mecánicas adecuadas. El conductor no puede operar bajo efectos de alcohol o sustancias. Puedes negarte a abordar si el vehículo presenta condiciones inseguras visibles.

**2. Derecho a la tarifa justa**
El conductor debe cobrar exactamente la tarifa oficial autorizada por el municipio. No puede cobrar tarifas adicionales por equipaje normal o por hora (salvo rutas especiales nocturnas debidamente señalizadas).

**3. Derecho al trato digno**
No puede negársete el servicio por tu apariencia, condición socioeconómica, discapacidad o cualquier otra razón discriminatoria.

**4. Derecho a la información**
Las rutas, horarios y tarifas deben ser información pública y accesible.

**5. Derecho a la atención en accidentes**
Si sufres un accidente siendo pasajero, el SOAT del vehículo te cubre sin importar si tenías o no seguro propio.

**Cómo presentar una queja:**
- **Supertransporte:** www.supertransporte.gov.co — entidad que regula el transporte terrestre en Colombia
- **Línea 018000 910011:** gratuita de Supertransporte
- **En Bogotá:** Transmilenio tiene su propio canal de PQRS en www.transmilenio.gov.co

**Consejo práctico:** Si el conductor te cobra de más o se niega a darte el vuelto, toma foto de la placa del vehículo y el número interno, y radicar la queja en Supertransporte. Las sanciones para los conductores infractores son significativas.',
  3, 'intermedio'
),

(
  'Infracciones de tránsito para ciclomotores y motos',
  'Colombia tiene uno de los mayores parques de motocicletas de América Latina, y también una de las tasas más altas de accidentalidad en este tipo de vehículos. Si conduces moto o ciclomotor, estas son las reglas que debes conocer para tu seguridad y para evitar sanciones.

**Equipos obligatorios para el motociclista:**
- Casco certificado para el conductor Y el parrillero — sin excepción
- Chaleco reflectivo con número de placa visible
- Calzado cerrado que cubra los tobillos
- Guantes (recomendados, no obligatorios por ley pero reducen lesiones graves)

**Las infracciones más graves y sus consecuencias:**

| Infracción | Sanción |
|---|---|
| Conducir sin casco | 30 SMLDV + inmovilización del vehículo |
| Parrillero sin casco | 30 SMLDV |
| Sin chaleco reflectivo | 15 SMLDV |
| Conducir sin licencia de moto | 15 SMLDV + inmovilización |
| Conducir sin SOAT | 30 SMLDV + inmovilización |
| Conducir en estado de embriaguez | 360 SMLDV + suspensión de licencia + curso obligatorio |
| Zigzaguear entre vehículos (hacer "el gusano") | 15 SMLDV |
| Transitar por andenes o ciclovías | 8 SMLDV |

**Restricciones en Bogotá:**
- Pico y placa para motos según el último dígito de la placa en horarios pico
- Prohibición de parrillero hombre en ciertas horas (medida de seguridad en zonas específicas)
- Obligatoriedad del chaleco con placa visible en todo momento

**Dato crítico:** En Colombia, las motos están involucradas en más del 50% de las muertes en accidentes de tránsito. El casco reduce el riesgo de muerte en un 42% y el de lesión cerebral grave en un 69% (OPS, 2023). No es opcional.',
  3, 'avanzado'
);


-- ============================================================
-- TRÁMITES ADICIONALES
-- ============================================================

INSERT INTO tramite (nombre, requisitos, enlace, id_categoria, pasos, tiempo_estimado) VALUES

-- EDUCACIÓN FINANCIERA
(
  'Solicitud de crédito educativo ICETEX',
  '- Cédula de ciudadanía o tarjeta de identidad vigente
- Registro civil de nacimiento
- Carta de admisión o constancia de matrícula de la institución educativa
- Puntaje SISBÉN (si aplica para crédito subsidiado)
- Información financiera del deudor solidario (codeudor): cédula, declaración de renta o certificado de ingresos',
  'https://www.icetex.gov.co',
  1,
  '1. Ingresa a www.icetex.gov.co y crea una cuenta con tu correo y número de cédula.
2. Selecciona "Créditos educativos" y elige el tipo: Tú Eliges (tasa de mercado) o Fondo de Sostenimiento (subsidiado por el Estado según puntaje SISBÉN).
3. Completa el formulario de solicitud con tus datos personales, información académica y datos del codeudor.
4. Adjunta los documentos requeridos en formato PDF.
5. El ICETEX evalúa la solicitud (10 a 20 días hábiles).
6. Si es aprobado, recibes el contrato por correo electrónico para firmar digitalmente.
7. El desembolso se hace directamente a la institución educativa.',
  '20 a 40 días hábiles desde la solicitud hasta el desembolso'
),

(
  'Apertura de CDT (Certificado de Depósito a Término)',
  '- Cédula de ciudadanía vigente
- Cuenta de ahorros activa en el banco donde vas a abrir el CDT (en la mayoría de casos)
- Monto mínimo de inversión (varía por entidad: desde $100.000 en algunos bancos digitales)',
  'https://www.superfinanciera.gov.co',
  1,
  '1. Compara tasas de interés entre bancos y cooperativas en www.superfinanciera.gov.co o en comparadores como elconfidente.com.co.
2. Una vez elegida la entidad, ingresa a su app o sitio web y busca "Abrir CDT" o "Inversión a plazo".
3. Selecciona el monto a invertir y el plazo (desde 30 días hasta 5 años — a mayor plazo, mayor tasa generalmente).
4. Confirma la operación. El dinero se debita de tu cuenta y queda bloqueado hasta el vencimiento del plazo.
5. Al vencimiento, el banco te paga el capital más los intereses acordados. Puedes renovar el CDT o retirarlo.
6. El CDT está cubierto por el Fogafín hasta $50 millones.',
  'Apertura inmediata / Rendimientos al vencimiento del plazo elegido'
),

-- TRÁMITES ADMINISTRATIVOS
(
  'Solicitud de beca Generación E del Ministerio de Educación',
  '- Puntaje SISBÉN (grupo A o B — verificar convocatoria vigente)
  - Puntaje de las Pruebas Saber 11 (mínimo requerido varía por convocatoria)
  - Admisión a IES (Institución de Educación Superior) pública acreditada
  - Cédula de ciudadanía o tarjeta de identidad
  - Certificado de calificaciones del bachillerato',
  'https://www.mineducacion.gov.co',
  2,
  '1. Verifica que la convocatoria esté abierta en www.mineducacion.gov.co → "Generación E".
2. Consulta tu puntaje SISBÉN en www.sisben.gov.co y verifica que estás en el grupo habilitado para la beca.
3. Presenta las Pruebas Saber 11 (si aún no las has presentado) y obtén tu resultado.
4. Aplica a una IES pública acreditada de alta calidad y obtén tu carta de admisión.
5. Ingresa al portal de Generación E con tu cédula y número ICFES.
6. Adjunta todos los documentos requeridos en el formulario en línea.
7. Espera la validación del Ministerio (el proceso puede tomar 30 a 60 días).
8. Si eres seleccionado, la beca cubre matrícula y un subsidio de sostenimiento.',
  '30 a 60 días hábiles (sujeto a convocatoria anual)'
),

(
  'Trámite de pasaporte colombiano por primera vez',
  '- Cédula de ciudadanía vigente (mayores de 18) o tarjeta de identidad + autorización notarial de padres (menores de edad)
  - Registro civil de nacimiento
  - Comprobante de pago de los derechos de expedición (varía según tipo de pasaporte)
  - En algunos casos: antecedentes judiciales',
  'https://www.cancilleria.gov.co',
  2,
  '1. Agenda tu cita en www.cancilleria.gov.co → "Pasaportes" → "Agenda tu cita". Las citas se abren con varias semanas de anticipación — agenda con tiempo.
2. Realiza el pago de los derechos de expedición en los bancos autorizados o en línea. El costo del pasaporte ordinario (32 páginas, 5 años de vigencia) es aproximadamente $250.000.
3. Asiste a la cita en la Cancillería o en el Consulado colombiano más cercano (en el exterior) con todos los documentos originales.
4. El funcionario capturará tu foto, firma y huella dactilar.
5. En 5 a 10 días hábiles el pasaporte está listo. Puedes recogerlo en el mismo punto o pagar el servicio de envío a domicilio.',
  '5 a 10 días hábiles después de la cita'
),

-- MOVILIDAD URBANA
(
  'Revisión técnico-mecánica del vehículo (RTM)',
  '- Tarjeta de propiedad del vehículo
  - SOAT vigente
  - Cédula del propietario o poseedor
  - El vehículo debe presentarse físicamente al CDA',
  'https://www.runt.com.co',
  3,
  '1. Verifica en www.runt.com.co con la placa del vehículo cuándo vence la RTM actual y en qué CDA (Centro de Diagnóstico Automotor) puedes realizarla.
2. Agenda cita en el CDA de tu preferencia — la mayoría permiten agendamiento en línea o por teléfono.
3. Lleva el vehículo al CDA en la fecha y hora agendadas con los documentos requeridos.
4. El proceso incluye revisión de: frenos, luces, emisiones de gases, llantas, sistema de dirección, cinturones y estructura general. Dura entre 30 y 60 minutos.
5. Si el vehículo aprueba, recibes el certificado de RTM válido (la vigencia depende del tipo de vehículo: carros particulares cada 2 años a partir del 6to año).
6. Si reprueba, tienes 15 días para hacer los ajustes y regresar sin costo adicional.',
  '30 a 60 minutos en el CDA'
),

(
  'Cómo reportar un accidente de tránsito ante el RUNT',
  '- Cédula de ciudadanía del conductor o propietario
  - Número de placa del vehículo involucrado
  - Informe de tránsito expedido por la Policía o el agente de tránsito
  - Número de SOAT del vehículo',
  'https://www.runt.com.co',
  3,
  '1. Llama al 123 inmediatamente si hay heridos para activar los servicios de emergencia.
2. Llama a la Policía de Tránsito (también al 123) para que se desplace al lugar y levante el informe oficial del accidente. Este informe es indispensable para cualquier reclamación posterior.
3. Toma evidencias fotográficas del lugar, los vehículos y las lesiones visibles antes de mover los vehículos.
4. Intercambia datos con el otro conductor: nombre, cédula, número de SOAT, placa del vehículo y datos de su seguro voluntario si tiene.
5. Con el informe de la Policía, dirígete a la aseguradora del SOAT del vehículo responsable para iniciar el proceso de reclamación.
6. El informe queda registrado en el RUNT (www.runt.com.co) y puede consultarse con la placa del vehículo.',
  'El reporte policial se levanta en el lugar. La reclamación al SOAT puede tomar 15 a 30 días hábiles.'
);


-- ============================================================
-- PREGUNTAS ADICIONALES (9 — 3 por categoría)
-- ============================================================

INSERT INTO pregunta (id_categoria, enunciado, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta) VALUES

-- EDUCACIÓN FINANCIERA
(
  1,
  '¿Cuál de las siguientes billeteras digitales en Colombia funciona incluso sin datos móviles, solo con minutos?',
  'Nequi',
  'Movii',
  'Daviplata',
  'Rappipay',
  'c'
),
(
  1,
  '¿Hasta qué monto protege el Fogafín los depósitos de un ahorrador en un banco colombiano?',
  '$10 millones de pesos',
  '$50 millones de pesos',
  '$100 millones de pesos',
  'No hay límite, protege todo el dinero depositado',
  'b'
),
(
  1,
  '¿Cuál es la tarifa general del IVA en Colombia?',
  '10%',
  '14%',
  '16%',
  '19%',
  'd'
),

-- TRÁMITES ADMINISTRATIVOS
(
  2,
  '¿Qué es el SISBÉN?',
  'Un banco público para personas de bajos ingresos',
  'El sistema de identificación de beneficiarios de programas sociales del Estado',
  'Un seguro de salud privado subsidiado',
  'Un programa de becas del Ministerio de Educación',
  'b'
),
(
  2,
  '¿A qué edad se puede tramitar la tarjeta de identidad en Colombia por primera vez?',
  'A los 5 años',
  'A los 7 años',
  'A los 10 años',
  'A los 14 años',
  'b'
),
(
  2,
  '¿Qué cubre principalmente el crédito del ICETEX?',
  'Gastos de alimentación y transporte del estudiante',
  'Financiación de estudios de educación superior con devolución posterior',
  'Subsidio de vivienda para estudiantes universitarios',
  'Pago de deudas financieras de los padres del estudiante',
  'b'
),

-- MOVILIDAD URBANA
(
  3,
  '¿Qué distancia lateral mínima deben guardar los vehículos al adelantar a un ciclista en Colombia?',
  '50 centímetros',
  '1 metro',
  '1.5 metros',
  '2 metros',
  'b'
),
(
  3,
  '¿Cuál es la sanción por conducir una motocicleta sin casco en Colombia?',
  '4 SMLDV',
  '15 SMLDV',
  '30 SMLDV más inmovilización del vehículo',
  'Solo una advertencia verbal',
  'c'
),
(
  3,
  'Si eres víctima de un accidente de tránsito en Colombia y el vehículo responsable no tiene SOAT, ¿qué entidad te cubre?',
  'No hay cobertura si el vehículo no tiene SOAT',
  'El FONSAT (Fondo de Seguro Obligatorio de Accidentes de Tránsito)',
  'La Secretaría de Movilidad de tu ciudad',
  'Tu EPS, pero debes pagar la diferencia',
  'b'
);

-- ============================================================
-- FIN DE LOS DATOS ADICIONALES v2
-- ============================================================