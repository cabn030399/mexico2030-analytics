# Proyecto Maestro

# 🇲🇽 México2030 Analytics

**Última actualización:** Julio 2026

---

# 1. Visión del Proyecto

Construir una plataforma de **Sports Analytics** enfocada en analizar el rendimiento histórico de la Selección Mexicana de Fútbol mediante técnicas de:

* Data Engineering.
* Data Analytics.
* Business Intelligence.
* Data Quality.
* Data Storytelling.

El proyecto funciona como:

* Portafolio profesional de Data Analytics.
* Plataforma de análisis deportivo rumbo al Mundial 2030.
* Base para el desarrollo de especialización en Sports Analytics.
* Base para futuras incorporaciones de datos de jugadores y análisis avanzados.

---

# 2. Identidad del Proyecto

## Nombre Oficial

**México2030 Analytics**

## Marca Analítica

**Tricolor Analytics**

## Serie Editorial

**El Laboratorio del Tri**

---

# 3. Objetivos Estratégicos

## Objetivos Profesionales

* Conseguir oportunidades laborales como Data Analyst.
* Especializarse progresivamente en Sports Analytics.
* Fortalecer el perfil profesional mediante proyectos demostrables.
* Construir un portafolio técnico diferenciador.

## Objetivos Técnicos

* Construir una arquitectura de datos por capas.
* Implementar procesos reproducibles de transformación.
* Utilizar BigQuery como plataforma de almacenamiento y consulta.
* Construir datasets analíticos preparados para BI.
* Desarrollar dashboards interactivos.
* Implementar mecanismos de procesamiento incremental.
* Incorporar progresivamente nuevas fuentes y dominios de datos.

---

# 4. Alcance Actual

## Incluido

El alcance actualmente completado comprende:

* Selección Mexicana Mayor Masculina.
* Resultados históricos de partidos.
* Pipeline de ingesta y transformación.
* Arquitectura Bronze / Silver / Gold.
* Procesamiento incremental basado en `match_key`.
* BigQuery como plataforma de almacenamiento.
* Tabla analítica `gold.fact_mexico_matches`.
* Dashboard V1 en Tableau Public.
* Documentación técnica del proyecto.

## Fuera del Alcance Actual

Todavía no forman parte del modelo analítico implementado:

* Selección Mexicana Femenil.
* Selecciones Sub-23 y Sub-20.
* Modelo analítico de jugadores.
* Ranking FIFA integrado al modelo Gold.
* Machine Learning.
* Modelos predictivos.

Los datos de jugadores y ranking forman parte de la evolución prevista del proyecto, no de la implementación actual.

---

# 5. Fuente de Datos

## Dataset

**International Football Results from 1872 to 2026**

**Autor:**

Mart Jürisoo

**Fuente:**

Kaggle

**Archivo utilizado para el pipeline de partidos:**

```text id="8y6g8n"
results.csv
```

El dataset contiene resultados históricos internacionales y constituye la fuente utilizada para construir las capas Bronze, Silver y Gold de partidos.

---

# 6. Cobertura Histórica

Cobertura validada para México:

| Métrica                  | Valor      |
| ------------------------ | ---------- |
| Primer partido de México | 1923-01-01 |
| Último partido de México | 2026-07-05 |
| Total de partidos        | 1,008      |

La cobertura corresponde a los partidos de la Selección Mexicana Mayor Masculina identificados en el dataset y utilizados en Gold.

---

# 7. Stack Tecnológico

## Data Engineering

* Python
* Pandas
* Jupyter Notebook

## Data Warehouse

* Google BigQuery

## SQL

* BigQuery SQL

## Visualización

* Tableau Public

## Versionamiento

* GitHub

## Publicación

* LinkedIn

---

# 8. Arquitectura Actual

```text
Dataset histórico
        ↓
001_data_ingestion.ipynb
        ↓
002_bronze_raw_matches.ipynb
        ↓
003_silver_matches.ipynb
        ↓
004_bigquery_incremental.ipynb
        ↓
BigQuery Staging
        ↓
Silver BigQuery
        ↓
Gold
        ↓
Tableau Public
```

La arquitectura separa los datos de origen, los datos procesados y los datos preparados para análisis.

---

# 9. Notebooks Principales

## 001 — Data Ingestion

```text id="26dh3x"
001_data_ingestion.ipynb
```

Responsabilidades:

* Carga del dataset histórico.
* Exploración inicial.
* Validación de estructura.
* Revisión de calidad de los datos.

---

## 002 — Bronze

```text id="d7p4v0"
002_bronze_raw_matches.ipynb
```

Responsabilidades:

* Preparación de la capa Bronze.
* Conservación de los datos de origen.
* Preparación para las siguientes etapas del pipeline.

---

## 003 — Silver

```text id="l6v8ch"
003_silver_matches.ipynb
```

Responsabilidades:

* Normalización de fechas.
* Exclusión de registros sin marcador.
* Creación de `match_id`.
* Creación de `match_key`.
* Validación de duplicados.
* Preparación de los datos para BigQuery.

---

## 004 — BigQuery Incremental

```text id="w9t1fc"
004_bigquery_incremental.ipynb
```

Responsabilidades:

* Comparación de registros existentes y nuevos.
* Detección incremental mediante `match_key`.
* Integración con BigQuery.
* Validaciones de idempotencia.
* Preparación de las capas posteriores.

---

# 10. Bronze Layer

Dataset:

```text id="w4s4z1"
bronze
```

Infraestructura disponible:

```text id="9y0gh4"
bronze.raw_matches
bronze.raw_players
bronze.raw_rankings
```

El pipeline actual de partidos utiliza principalmente la estructura correspondiente a `raw_matches`.

---

# 11. Silver Layer

Dataset:

```text id="6mqk2d"
silver
```

Tabla principal:

```text id="4es4vq"
silver.matches
```

### Granularidad

```text id="2z3vfa"
1 fila = 1 partido con resultado disponible
```

### Resultado actual

```text id="b9v2wt"
49,501 registros
```

### Validaciones

* `49,501` `match_id` únicos.
* `49,501` `match_key` únicas.
* `0` `match_key` duplicadas.
* `0` registros involucrados en duplicados.
* `0` `match_key` nulas.

Los 4 registros originales sin marcador fueron excluidos de Silver.

---

# 12. `match_key`

La identificación lógica de un partido utiliza:

```text id="l6o3a1"
date|home_team|away_team|tournament
```

Ejemplo:

```text id="1q2zqk"
2026-08-28|Mexico|Test Team|Test Tournament
```

## Propósito

`match_key` permite:

* Identificar lógicamente un partido.
* Detectar duplicados.
* Comparar registros existentes con registros nuevos.
* Implementar procesamiento incremental.

El proceso incremental no utiliza `match_id` como criterio principal de existencia.

---

# 13. Procesamiento Incremental

El procesamiento incremental se encuentra implementado en:

```text id="oq1d8y"
004_bigquery_incremental.ipynb
```

## Prueba de idempotencia

Al comparar los datos actuales de México contra sí mismos:

```text id="o9b8l4"
Partidos existentes: 1008
Partidos nuevos: 0
```

Resultado:

* No se generaron nuevos registros.

## Prueba con nuevo registro

Se utilizó un partido sintético:

```text id="m0a3t4"
2026-08-28|Mexico|Test Team|Test Tournament
```

Resultado:

```text id="p3p7q2"
Partidos existentes: 1008
Partidos nuevos detectados: 1
```

Estas pruebas validan la lógica de identificación incremental mediante `match_key`.

### Alcance

El procesamiento incremental está implementado y validado dentro del alcance actual.

No se considera un sistema autónomo de producción ni una actualización continua sin intervención.

---

# 14. BigQuery

## Datasets

```text id="q8v5f6"
bronze
silver
gold
```

## Tablas principales

### Bronze

```text id="b0n5n4"
bronze.raw_matches
bronze.raw_players
bronze.raw_rankings
```

### Silver

```text id="7r9x8j"
silver.matches
```

### Gold

```text id="9s3v2a"
gold.fact_mexico_matches
```

---

# 15. Gold Layer

Dataset:

```text id="w6j2q9"
gold
```

Tabla:

```text id="e0t8p1"
gold.fact_mexico_matches
```

### Granularidad

```text id="g4h5v2"
1 fila = 1 partido de México
```

### Variables principales

* `match_id`
* `match_date`
* `year`
* `opponent`
* `tournament`
* `venue_type`
* `goals_for`
* `goals_against`
* `goal_difference`
* `result`

### Resultado

```text id="m5k3n7"
1,008 partidos de México
```

---

# 16. Calidad de Datos

Las validaciones principales realizadas sobre el pipeline incluyen:

### Silver

```text id="d3r6s8"
49,501 registros
49,501 match_id únicos
49,501 match_key únicas
0 match_key duplicadas
0 registros involucrados en duplicados
```

### México

```text id="f7k2q1"
1,008 partidos
```

### Gold

```text id="v4c9m2"
1,008 partidos
```

Estas validaciones permiten comprobar la consistencia estructural de las capas utilizadas para análisis.

---

# 17. Dashboard Oficial

## Tableau Public

Dashboard:

**México2030 Analytics — Dashboard V1**

Estado:

✅ Publicado

Fuente analítica:

```text id="n2f6s1"
gold.fact_mexico_matches
```

### KPIs

* Partidos Jugados.
* Victorias.
* Empates.
* Derrotas.
* % Victorias.

### Visualizaciones

* Rendimiento por Año.
* Resultados por Competición.
* Home vs Away vs Neutral.
* Top 10 Rivales Más Enfrentados.

---

# 18. Documentación Oficial

La documentación técnica principal del proyecto está compuesta por:

```text id="d0c5r6"
README.md
Project_Master.md
Architecture.md
Data_Dictionary.md
CHANGELOG.md
```

Estos documentos deben mantenerse consistentes con el estado real de la arquitectura y del pipeline.

---

# 19. Estado Oficial del Proyecto

## Estado actual

### Pipeline de partidos

✅ Completado

### Integración BigQuery

✅ Completada

### Procesamiento incremental

✅ Implementado y validado

### Gold de partidos de México

✅ Completado

### Dashboard Tableau V1

✅ Publicado

### Documentación técnica

✅ Actualizada

### Datos de jugadores

⏳ Siguiente fase

---

# 20. Estado de Versión

La documentación histórica registra:

```text id="5j0w4d"
v0.5.0
```

como la última versión formal documentada.

No se asigna una nueva versión hasta establecer un criterio formal de versionamiento para el proyecto.

---

# 21. Historial de Sprints

## Sprint 1 — Exploración Inicial

**Estado:** COMPLETADO

Entregables:

* Exploración del dataset histórico.
* Validación inicial de calidad.
* Definición de la estrategia MVP.

---

## Sprint 2 — Bronze Layer

**Estado:** COMPLETADO

Entregables:

* `001_data_ingestion.ipynb`
* `002_bronze_raw_matches.ipynb`

Resultados:

* Estructura Bronze preparada.
* Datos de origen preparados para transformación.

---

## Sprint 3 — Silver Layer

**Estado:** COMPLETADO

Entregables:

* `003_silver_matches.ipynb`

Resultados:

* 49,501 partidos válidos.
* 0 `match_key` duplicadas.
* 0 registros involucrados en duplicados.
* `match_id` generado.
* `match_key` implementada.

---

## Sprint 4 — Gold Layer

**Estado:** COMPLETADO

Entregables:

* `gold.fact_mexico_matches`

Resultados:

* 1,008 partidos de México.
* Cobertura histórica 1923–2026.

---

## Sprint 5 — Dashboard Tableau V1

**Estado:** COMPLETADO

Resultados:

* KPIs definidos.
* Visualizaciones construidas.
* Dashboard publicado en Tableau Public.

---

## Sprint 6 — BigQuery e Incrementalidad

**Estado:** COMPLETADO

Entregables:

* `004_bigquery_incremental.ipynb`
* Integración con BigQuery.
* Procesamiento incremental.
* Validación de idempotencia.
* Validación con registro sintético.
* Validaciones finales de las capas.

Resultado:

* Pipeline de partidos implementado y validado.

---

# 22. Roadmap

## Fase 1 — Pipeline de Partidos

**Estado:** COMPLETADA

Incluye:

* Ingesta.
* Bronze.
* Silver.
* Gold.
* BigQuery.
* Procesamiento incremental.
* Validaciones.
* Dashboard V1.

---

## Fase 2 — Datos de Jugadores

**Estado:** SIGUIENTE FASE

Objetivos:

* Incorporar datos de jugadores.
* Diseñar Silver de jugadores.
* Construir Gold de jugadores.
* Definir KPIs individuales.
* Preparar análisis y visualizaciones de jugadores.

---

## Fase 3 — Analytics Avanzado

**Estado:** FUTURA

Posibles líneas:

* Rendimiento por década.
* Análisis por rival.
* Rendimiento por torneo.
* Evolución histórica.
* Análisis individual de jugadores.

---

## Fase 4 — Evolución del Dashboard

**Estado:** FUTURA

Posibles mejoras:

* Filtros globales.
* Mejoras visuales.
* Storytelling ejecutivo.
* Nuevas métricas.
* Integración de análisis de jugadores.

---

# 23. Decisiones Arquitectónicas

## DA-001

Se excluye la Selección Femenil del alcance inicial.

**Estado:** Aprobado.

---

## DA-002

Se adopta arquitectura Bronze / Silver / Gold.

**Estado:** Aprobado.

---

## DA-003

Se adopta estrategia MVP basada inicialmente en un dataset histórico consolidado.

**Estado:** Aprobado.

---

## DA-004

Se establece BigQuery como plataforma de almacenamiento y consulta analítica.

**Estado:** Aprobado.

---

## DA-005

Se adopta como fuente principal el dataset:

**International Football Results from 1872 to 2026**

Autor:

**Mart Jürisoo**

Fuente:

**Kaggle**

**Estado:** Aprobado.

---

## DA-006

Se establece `gold.fact_mexico_matches` como primera tabla Gold oficial.

Granularidad:

```text id="m2k7w8"
1 fila = 1 partido de México
```

**Estado:** Aprobado.

---

## DA-007

Se adopta Tableau Public como plataforma de visualización.

**Estado:** Aprobado.

---

## DA-008

Se valida la cobertura histórica utilizada para México.

Resultados:

* 1,008 partidos.
* 1923–2026.

**Estado:** Aprobado.

---

## DA-009

Se completa el MVP inicial del proyecto.

**Estado:** Cerrado.

---

## DA-010

**Fecha:** Julio 2026

Se completa la auditoría documental del proyecto.

Documentos actualizados:

* `README.md`
* `Project_Master.md`
* `Architecture.md`
* `Data_Dictionary.md`
* `CHANGELOG.md`

### Resultado

La documentación refleja el estado real del proyecto después de completar el pipeline de partidos, su integración con BigQuery y el procesamiento incremental.

**Estado:** Aprobado.

---

## DA-011

Se adopta `match_key` como clave lógica para la identificación de partidos y el procesamiento incremental.

Formato:

```text id="r7f3c2"
date|home_team|away_team|tournament
```

**Estado:** Aprobado.

---

# 24. Principios Rectores

### Consistencia sobre complejidad

Priorizar soluciones simples, mantenibles y defendibles técnicamente.

### Calidad antes de visualización

Los datos deben validarse antes de utilizarlos en análisis o dashboards.

### Trazabilidad

Cada transformación debe corresponder a una etapa identificable del pipeline.

### Incrementalidad

La incorporación de nuevos partidos debe basarse en una clave lógica estable.

### Evolución por fases

Las nuevas capacidades deben incorporarse después de consolidar la etapa anterior.

### Publicación

> Un análisis publicado vale más que un análisis perfecto que nunca se publica.
