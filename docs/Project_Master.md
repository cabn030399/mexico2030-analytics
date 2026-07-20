# Proyecto Maestro
# 🇲🇽 México2030 Analytics

Última actualización: Julio 2026

---

# 1. Visión del Proyecto

Construir una plataforma de Sports Analytics enfocada en analizar el rendimiento histórico y futuro de la Selección Mexicana de Fútbol mediante técnicas de Data Engineering, Data Analytics, Business Intelligence y Storytelling.

El proyecto servirá como:

- Portafolio profesional de Data Analytics.
- Plataforma de análisis rumbo al Mundial 2030.
- Herramienta de desarrollo de marca personal en Sports Analytics.
- Base para futuras automatizaciones y análisis avanzados.

---

# 2. Identidad del Proyecto

## Nombre Oficial

México2030 Analytics

## Marca Analítica

Tricolor Analytics

## Serie Editorial

El Laboratorio del Tri

---

# 3. Objetivos Estratégicos

## Objetivos Profesionales

- Conseguir oportunidades laborales como Data Analyst.
- Especializarse en Sports Analytics.
- Fortalecer el perfil profesional en LinkedIn.
- Construir un portafolio técnico diferenciador.

## Objetivos Técnicos

- Implementar una arquitectura moderna de datos.
- Construir dashboards interactivos.
- Automatizar la actualización de datos.
- Generar análisis continuos rumbo al Mundial 2030.

---

# 4. Alcance Actual (MVP)

## Incluido

- Selección Mexicana Mayor Masculina.
- Resultados históricos oficiales.
- Dashboard interactivo en Tableau Public.
- Publicaciones analíticas en LinkedIn.
- Arquitectura Bronze / Silver / Gold.
- Procesos ETL con Python.
- Data Warehouse en BigQuery.

## Fuera del Alcance Actual

- Selección Mexicana Femenil.
- Selección Sub-23.
- Selección Sub-20.
- Datos detallados de jugadores.
- Machine Learning.
- Modelos predictivos.

---

# 5. Cobertura Histórica

Fuente oficial validada:

International Football Results from 1872 to 2026

Autor:
Mart Jürisoo (Kaggle)

Cobertura actual de México:

- Primer partido: 1923-01-01
- Último partido: 2026-07-05
- Total de partidos: 1008

---

# 6. Stack Tecnológico Aprobado

## Data Engineering

- Python
- Pandas
- Jupyter Notebook

## Data Warehouse

- Google BigQuery

## SQL

- BigQuery SQL

## Visualización

- Tableau Public

## Versionamiento

- GitHub

## Publicación

- LinkedIn

---

# 7. Arquitectura MVP Implementada

```text
Dataset Kaggle
        ↓
Python ETL
        ↓
BigQuery Bronze
        ↓
BigQuery Silver
        ↓
BigQuery Gold
        ↓
Tableau Public
        ↓
LinkedIn
```

---

# 8. Arquitectura de Datos

## Proyecto BigQuery

mexico2030analytics

## Datasets

### Bronze

- raw_matches

### Silver

- matches

### Gold

- fact_mexico_matches

---

# 9. Regla Oficial del Proyecto

> Un análisis publicado vale más que un análisis perfecto que nunca se publica.

---

# 10. Restricciones

## Tiempo disponible

Mínimo 5 horas por semana.

## Prioridad

Consistencia y continuidad sobre complejidad técnica.

---

# 11. Estado Oficial del Proyecto

## Versión Actual

v0.1.0

## Estado

✅ MVP COMPLETADO

## Fecha de Cierre

Julio 2026

---

# 12. Historial de Sprints

## Sprint 1 – Exploración Inicial

Estado: COMPLETADO

Entregables:

- Exploración del dataset histórico.
- Validación inicial de calidad.

Resultados:

- Dataset seleccionado.
- Estrategia MVP definida.

---

## Sprint 2 – Bronze Layer

Estado: COMPLETADO

Entregables:

- 001_data_ingestion.ipynb
- 002_bronze_raw_matches.ipynb

Resultados:

- Datos cargados en BigQuery Bronze.

---

## Sprint 3 – Silver Layer

Estado: COMPLETADO

Entregables:

- 003_silver_matches.ipynb

Resultados:

- 49,501 partidos válidos.
- 0 duplicados.
- 0 valores nulos.
- match_id generado.

---

## Sprint 4 – Gold Layer

Estado: COMPLETADO

Entregables:

- fact_mexico_matches

Resultados:

- 1008 partidos de México.
- Cobertura histórica 1923–2026.

---

## Sprint 5 – Dashboard Tableau V1

Estado: COMPLETADO

KPIs:

- Partidos Jugados
- Victorias
- Empates
- Derrotas
- % Victorias

Visualizaciones:

- Rendimiento por Año
- Resultados por Competición
- Home vs Away vs Neutral
- Top 10 Rivales

Resultado:

Dashboard publicado en Tableau Public.

---

# 13. Dashboard Oficial

Tableau Public:

https://public.tableau.com/views/Mexico2030_Analytics_V1_twb/DashboardV1SELECCIONMEXICO

Estado:

✅ Publicado

---

# 14. Roadmap

## Fase 1 – MVP

Estado: COMPLETADA

- Infraestructura BigQuery.
- Bronze Layer.
- Silver Layer.
- Gold Layer.
- Dashboard Tableau V1.

---

## Fase 2 – Dashboard V1.1

Estado: EN PLANIFICACIÓN

Objetivos:

- Filtros globales.
- Mejora visual.
- Storytelling ejecutivo.
- Optimización del layout.

---

## Fase 3 – Analytics Avanzado

Pendiente

- Rendimiento por década.
- Análisis por rival.
- Rendimiento por torneo.
- Nuevas tablas Gold.

---

## Fase 4 – Automatización

Pendiente

- Integración con APIs.
- Actualización automática.
- Automatización de dashboards.

---

# 15. Decisiones Arquitectónicas

## DA-001

Se excluye la Selección Femenil del alcance inicial.

Estado: Aprobado.

---

## DA-002

Se adopta arquitectura Bronze / Silver / Gold.

Estado: Aprobado.

---

## DA-003

Se adopta estrategia MVP basada en dataset histórico consolidado.

Estado: Aprobado.

---

## DA-004

Proyecto BigQuery oficial:

mexico2030analytics

Estado: Aprobado.

---

## DA-005

Se aprueba el dataset oficial:

International Football Results from 1872 to 2026

Autor:
Mart Jürisoo

Fuente:
Kaggle

Estado: Aprobado.

---

## DA-006

Se aprueba fact_mexico_matches como primera tabla Gold oficial.

Granularidad:

1 fila = 1 partido de México.

Estado: Aprobado.

---

## DA-007

Se adopta Tableau Public como plataforma oficial de visualización.

Estado: Aprobado.

---

## DA-008

Se valida la cobertura histórica oficial.

Resultados:

- 1008 partidos.
- 1923–2026.

Estado: Aprobado.

---

## DA-009

Se declara completado el MVP v0.1.0.

Estado:

✅ Cerrado
DA-010

Fecha: Julio 2026

Se completa la auditoría documental del proyecto.

Documentos actualizados:

- README.md
- Project_Master.md
- Architecture.md
- Data_Dictionary.md
- CHANGELOG.md

Resultado:

La documentación refleja el estado real del proyecto tras el cierre del MVP v0.1.0.

Estado:

Aprobado
# Gold Cup – Auditoría de Calidad de Datos

**Fecha:** 19 de julio de 2026

## Fuentes de validación

* RSSSF
* CONCACAF
* Gold Layer (`gold.fact_mexico_matches`)

## Resultados

* Partidos jugados: 91 ✅
* Victorias: 67 ✅
* Empates: 13 ✅
* Derrotas: 11 ✅
* Porcentaje de victorias: 73.63% ✅
* Partidos como local: 10 ✅
* Partidos como visitante: 8 ✅
* Partidos en sede neutral: 73 ✅
* Top 10 rivales enfrentados: Validado ✅

## Hallazgo detectado

Durante la auditoría se identificó una discrepancia entre la Gold Layer y la visualización "Top 10 Rivales" en Tableau.

### Síntoma

* Panamá (6 partidos) no aparecía en el Top 10.
* Brasil (3 partidos) aparecía dentro del Top 10.
* La visualización mostraba únicamente 8 rivales.

### Causa raíz

Existía un filtro adicional sobre el campo `Opponent` aplicado en la hoja de Tableau.

### Acción correctiva

Se eliminó el filtro `Opponent` y se verificó nuevamente la visualización.

### Resultado

La visualización quedó alineada con la Gold Layer:

* Panamá ocupa la posición 7 con 6 partidos.
* Brasil ocupa la posición 11 con 3 partidos.

## Conclusión

La auditoría confirmó la consistencia entre la Gold Layer y las fuentes externas consultadas. No se detectaron errores de calidad en los datos de Gold Cup. La única incidencia encontrada correspondía a una configuración de visualización en Tableau y fue corregida exitosamente.

**Estado final:** APROBADO ✅

**Score:** 9/9 validaciones aprobadas.
# FIFA World Cup – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la consistencia de las métricas principales del historial de México en Copas del Mundo y comprobar la alineación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Durante la auditoría inicial se detectó que el filtro:

```sql
WHERE tournament LIKE '%World Cup%'
```

incluía dos competiciones diferentes:

| Competición                  | Partidos |
| ---------------------------- | -------: |
| FIFA World Cup qualification |      160 |
| FIFA World Cup               |       65 |

Se corrigió el criterio utilizando únicamente:

```sql
WHERE tournament = 'FIFA World Cup'
```

---

# Resultados validados

## WC-001 — Partidos jugados

Resultado:

**65 partidos**

Estado:

✅ VALIDADO

---

## WC-002 — Victorias

Resultado:

**21 victorias**

Estado:

✅ VALIDADO

---

## WC-003 — Empates

Resultado:

**15 empates**

Estado:

✅ VALIDADO

---

## WC-004 — Derrotas

Resultado:

**29 derrotas**

Estado:

✅ VALIDADO

---

## WC-005 — Porcentaje de victorias

Cálculo:

21 / 65 = 32.31%

Resultado:

**32.31%**

Estado:

✅ VALIDADO

---

# Validación por condición de sede

| Tipo    | Partidos |
| ------- | -------: |
| Neutral |       46 |
| Home    |       14 |
| Away    |        5 |

Comprobación:

46 + 14 + 5 = 65

Estado:

✅ VALIDADO

---

# WC-009 — Top rivales enfrentados

Resultado Gold Layer:

| Posición | Rival       | Partidos |
| -------- | ----------- | -------: |
| 1        | Brazil      |        5 |
| 2        | Germany     |        4 |
| 3        | France      |        4 |
| 4        | Argentina   |        4 |
| 5        | Italy       |        3 |
| 6        | Belgium     |        3 |
| 7        | South Korea |        3 |
| 8        | Netherlands |        2 |
| 9        | England     |        2 |
| 10       | Poland      |        2 |

Validación:

* Orden correcto en Tableau.
* Rivales coinciden con Gold Layer.
* No se detectaron problemas de normalización de nombres.

Estado:

✅ VALIDADO

---

# Hallazgo detectado

## Filtro de competición

Se identificó que usar búsquedas amplias por nombre de torneo puede mezclar:

* Copa del Mundo
* Eliminatorias mundialistas

Acción correctiva:

Definir filtros exactos por competición.

Ejemplo:

Correcto:

```sql
tournament = 'FIFA World Cup'
```

Incorrecto:

```sql
tournament LIKE '%World Cup%'
```

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

## Score final

**9/9 validaciones aprobadas**

Estado:

# APROBADO ✅
# Copa América – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** Copa América
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la consistencia de las métricas históricas de México en Copa América mediante la comparación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'Copa América'
```

Total de registros analizados:

**51 partidos**

---

# Resultados validados

## CA-001 — Partidos jugados

Resultado:

**51 partidos**

Estado:

✅ VALIDADO

---

## CA-002 — Victorias

Resultado:

**20 victorias**

Estado:

✅ VALIDADO

---

## CA-003 — Empates

Resultado:

**14 empates**

Estado:

✅ VALIDADO

---

## CA-004 — Derrotas

Resultado:

**17 derrotas**

Estado:

✅ VALIDADO

---

## CA-005 — Porcentaje de victorias

Cálculo:

20 / 51 = 39.21%

Resultado:

**39.21%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Neutral |       46 |
| Away    |        5 |
| Home    |        0 |

Comprobación:

46 + 5 + 0 = 51

Estado:

✅ VALIDADO

---

# CA-009 — Top 10 rivales enfrentados

| Posición | Rival     | Partidos |
| -------- | --------- | -------: |
| 1        | Chile     |        7 |
| 2        | Uruguay   |        6 |
| 3        | Brazil    |        6 |
| 4        | Ecuador   |        6 |
| 5        | Peru      |        5 |
| 6        | Venezuela |        4 |
| 7        | Argentina |        4 |
| 8        | Bolivia   |        3 |
| 9        | Paraguay  |        3 |
| 10       | Colombia  |        3 |

Validación:

* Orden confirmado en Tableau.
* Valores coinciden con Gold Layer.
* No se detectaron problemas de nombres de rivales.

Estado:

✅ VALIDADO

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score: 9/9 validaciones aprobadas**
# CONCACAF Nations League – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** CONCACAF Nations League
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la calidad y consistencia de las métricas históricas de México en la CONCACAF Nations League mediante la comparación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'CONCACAF Nations League'
```

Registros analizados:

**20 partidos**

---

# Resultados validados

## NL-001 — Partidos jugados

Resultado:

**20 partidos**

Estado:

✅ VALIDADO

---

## NL-002 — Victorias

Resultado:

**12 victorias**

Estado:

✅ VALIDADO

---

## NL-003 — Empates

Resultado:

**3 empates**

Estado:

✅ VALIDADO

---

## NL-004 — Derrotas

Resultado:

**5 derrotas**

Estado:

✅ VALIDADO

---

## NL-005 — Porcentaje de victorias

Cálculo:

[
12/20 = 60%
]

Resultado:

**60%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Away    |        9 |
| Home    |        6 |
| Neutral |        5 |

Comprobación:

9 + 6 + 5 = 20

Estado:

✅ VALIDADO

---

# NL-009 — Top rivales enfrentados

Resultado:

| Posición | Rival         | Partidos |
| -------- | ------------- | -------: |
| 1        | Panama        |        5 |
| 2        | Honduras      |        4 |
| 3        | United States |        3 |
| 4        | Jamaica       |        2 |
| 5        | Bermuda       |        2 |
| 6        | Suriname      |        2 |
| 7        | Costa Rica    |        1 |
| 8        | Canada        |        1 |

---

## Observación

La competición cuenta con un número reducido de ediciones, por lo que México solamente registra enfrentamientos contra 8 selecciones diferentes.

No se identificaron problemas de datos.

El Top de rivales fue validado correctamente aunque no alcanza 10 elementos debido al tamaño del universo.

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score final: 9/9 validaciones aprobadas**
# FIFA World Cup Qualification – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** FIFA World Cup qualification
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la calidad y consistencia de las métricas históricas de México en eliminatorias mundialistas mediante:

* Gold Layer
* Dashboard Tableau
* Contraste con fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'FIFA World Cup qualification'
```

Registros analizados:

**160 partidos**

---

# Resultados validados

## WCQ-001 — Partidos jugados

Resultado:

**160 partidos**

Estado:

✅ VALIDADO

---

## WCQ-002 — Victorias

Resultado:

**105 victorias**

Estado:

✅ VALIDADO

---

## WCQ-003 — Empates

Resultado:

**32 empates**

Estado:

✅ VALIDADO

---

## WCQ-004 — Derrotas

Resultado:

**23 derrotas**

Estado:

✅ VALIDADO

---

# Validación matemática

| Resultado | Partidos |
| --------- | -------: |
| Win       |      105 |
| Draw      |       32 |
| Loss      |       23 |
| Total     |      160 |

Comprobación:

105 + 32 + 23 = 160

Estado:

✅ VALIDADO

---

# WCQ-005 — Porcentaje de victorias

Cálculo:

105 / 160

Resultado:

**65.63%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Home    |       84 |
| Away    |       71 |
| Neutral |        5 |

Comprobación:

84 + 71 + 5 = 160

Estado:

✅ VALIDADO

---

# WCQ-009 — Top 10 rivales enfrentados

| Posición | Rival                            | Partidos |
| -------- | -------------------------------- | -------: |
| 1        | United States                    |       24 |
| 2        | Costa Rica                       |       24 |
| 3        | Honduras                         |       22 |
| 4        | Canada                           |       14 |
| 5        | Jamaica                          |       14 |
| 6        | El Salvador                      |       12 |
| 7        | Trinidad and Tobago              |       12 |
| 8        | Panama                           |       10 |
| 9        | Saint Vincent and the Grenadines |        6 |
| 10       | Cuba                             |        4 |

Validación:

* Orden confirmado en Tableau.
* Valores coinciden con Gold Layer.
* Sin problemas de filtros detectados.

Estado:

✅ VALIDADO

---

# Validación externa

Se realizó contraste histórico con fuentes externas relacionadas con:

* estructura de eliminatorias FIFA/CONCACAF
* rivales históricos de México
* formatos de clasificación mundialista

Resultados:

* La separación entre competición final y clasificación es correcta.
* Los rivales principales coinciden con la historia competitiva de CONCACAF.
* La distribución local/visitante corresponde al formato histórico de eliminatorias.

Nota metodológica:

No existe una fuente pública única que presente exactamente el mismo agregado histórico de 160 partidos con el mismo criterio del dataset.

Por lo tanto, la validación externa se considera:

**Validación de consistencia histórica y estructural.**

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score final: 9/9 validaciones aprobadas**




