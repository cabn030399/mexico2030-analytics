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

# Project Master Update

## Fase: Auditoría de Calidad de Datos V1.0

**Fecha de cierre:** 19 de julio de 2026

---

# DEC-XXX — Modelo histórico auditado y validado

## Contexto

Antes de continuar con nuevos dashboards y análisis avanzados, se decidió realizar una auditoría completa de las métricas históricas utilizadas en México2030 Analytics.

El objetivo fue asegurar que los indicadores principales del modelo fueran consistentes, reproducibles y confiables.

---

# Alcance de auditoría

La validación se realizó sobre la tabla:

```
gold.fact_mexico_matches
```

Métricas auditadas:

* Partidos jugados
* Victorias
* Empates
* Derrotas
* Porcentaje de victorias
* Distribución por sede:

  * Home
  * Away
  * Neutral
* Top rivales enfrentados

---

# Competiciones auditadas

| Competición                  | Partidos | Estado     |
| ---------------------------- | -------: | ---------- |
| Friendly                     |      485 | ✅ Validado |
| FIFA World Cup Qualification |      160 | ✅ Validado |
| Gold Cup                     |       91 | ✅ Validado |
| FIFA World Cup               |       65 | ✅ Validado |
| Copa América                 |       51 | ✅ Validado |
| CONCACAF Nations League      |       20 | ✅ Validado |

---

# Resultado global

Total de partidos auditados:

```
872 partidos
```

Validaciones realizadas:

```
6 competiciones × 9 métricas = 54 validaciones
```

Resultado:

```
54/54 validaciones aprobadas
```

Estado:

✅ Modelo histórico validado

---

# Metodología aplicada

Cada competición siguió el mismo proceso:

1. Confirmación del nombre exacto del torneo dentro del modelo.
2. Extracción de métricas desde Gold Layer.
3. Comparación contra Dashboard Tableau.
4. Validación matemática de totales.
5. Revisión de distribución de sedes.
6. Validación del ranking de rivales.
7. Contraste histórico externo.

---

# Decisiones técnicas derivadas

## DEC-XXX-01 — Uso obligatorio de filtros exactos de competición

Se establece como estándar utilizar:

```sql
WHERE tournament = 'Nombre exacto'
```

Evitando filtros ambiguos como:

```sql
LIKE '%texto%'
```

para prevenir mezcla entre competiciones similares.

---

## DEC-XXX-02 — Auditoría previa a nuevos dashboards

Todo nuevo dashboard o análisis construido sobre Gold Layer deberá utilizar únicamente métricas previamente validadas.

---

# Impacto en el proyecto

Con la auditoría completada, México2030 Analytics cuenta con una base histórica confiable para desarrollar:

* Dashboard de rivales.
* Dashboard mundialista.
* Análisis comparativo por ciclos.
* Scouting.
* Modelos predictivos futuros.

---

# Estado de la fase

COMPLETADA ✅

Siguiente fase:

Desarrollo de dashboards especializados y generación de insights de Sports Analytics.

