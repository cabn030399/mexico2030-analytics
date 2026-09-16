# 🇲🇽 México2030 Analytics

## Tricolor Analytics

Proyecto de **Sports Analytics** enfocado en analizar el rendimiento histórico de la Selección Mexicana de Fútbol mediante técnicas de **Data Analytics, Data Engineering y Business Intelligence**.

El proyecto integra un pipeline reproducible para transformar resultados históricos en datos analíticos estructurados, almacenarlos en **Google BigQuery** y utilizarlos para construir dashboards e indicadores de rendimiento.

El objetivo es desarrollar una base analítica que permita estudiar la evolución de México y posteriormente incorporar información adicional para el seguimiento rumbo al Mundial 2030.

---

## 🔗 Enlaces

### 📊 Dashboard Tableau Public

https://public.tableau.com/app/profile/carlos.borja1355/viz/Mexico2030_Analytics_V1_twb/RendimientodeMxicoporAo

### 💼 LinkedIn

https://www.linkedin.com/in/carlos-borja-analista

### 💻 GitHub

https://github.com/cabn030399

---

## 📸 Dashboard MVP

<img width="1366" height="768" alt="Dashboard México2030 Analytics" src="https://github.com/user-attachments/assets/026875ca-e9d2-4bbf-a7eb-19a6ebf96836" />

---

## 🎯 Objetivo del Proyecto

México2030 Analytics busca responder preguntas analíticas como:

* ¿Cómo ha evolucionado el rendimiento de México a lo largo de su historia?
* ¿Contra qué rivales se ha enfrentado con mayor frecuencia?
* ¿Cómo cambia el desempeño según el torneo?
* ¿Cómo varían los resultados entre local, visitante y sede neutral?
* ¿Qué tendencias históricas pueden identificarse para contextualizar el camino hacia 2030?

El proyecto prioriza la **calidad de los datos, trazabilidad, reproducibilidad y separación entre las capas de procesamiento y análisis**.

---

## 📊 Alcance Actual

### Incluido

* Selección Mexicana Mayor Masculina.
* Resultados históricos de partidos.
* Procesamiento de datos mediante Python y Pandas.
* Arquitectura de datos Bronze / Silver / Gold.
* Validaciones de calidad y duplicidad.
* Estrategia incremental basada en una clave de negocio (`match_key`).
* Integración con Google BigQuery.
* Modelo analítico Gold para partidos de México.
* Dashboard interactivo en Tableau Public.
* Publicación de análisis en LinkedIn.

### No incluido todavía

* Datos de jugadores.
* Selección Femenil.
* Selecciones Sub-23 y Sub-20.
* Modelos predictivos.
* Machine Learning.

Los datos de jugadores corresponden a la **siguiente fase del proyecto**, no a una funcionalidad descartada.

---

## 📂 Dataset

### Fuente principal

**International Football Results from 1872 to 2026**

Autor: **Mart Jürisoo (Kaggle)**

El dataset contiene resultados históricos de partidos internacionales y constituye la fuente de entrada utilizada para construir las capas analíticas del proyecto.

### Cobertura validada para México

| Métrica           |      Valor |
| ----------------- | ---------: |
| Primer partido    | 1923-01-01 |
| Último partido    | 2026-07-05 |
| Total de partidos |      1,008 |

Los 1,008 partidos corresponden al subconjunto utilizado para construir el modelo analítico de la Selección Mexicana.

---

## 🏗️ Arquitectura

```text
Fuente de datos
      ↓
001 Data Ingestion
      ↓
002 Bronze
      ↓
003 Silver
      ↓
004 BigQuery Incremental
      ↓
BigQuery Staging
      ↓
Silver BigQuery
      ↓
Gold
      ↓
Tableau Public
```

La arquitectura separa la ingesta, transformación, almacenamiento y consumo analítico.

### Capas y componentes

#### Bronze

Capa destinada a conservar los datos de entrada en una estructura cercana a la fuente original.

* `bronze.raw_matches`
* `bronze.raw_players`
* `bronze.raw_rankings`

La infraestructura Bronze se encuentra creada en BigQuery para soportar futuras fuentes y extensiones del proyecto.

#### Silver

Capa de datos limpios y estructurados.

* `silver.matches`

En esta capa se realizan transformaciones como:

* Conversión y normalización de fechas.
* Eliminación de registros sin resultado de partido.
* Construcción de identificadores.
* Validación de duplicados.
* Generación de `match_key`.

La clave de negocio utilizada para identificar un partido es:

```text
date|home_team|away_team|tournament
```

Esta clave permite detectar registros existentes independientemente del `match_id` secuencial.

#### Gold

Capa orientada al análisis de la Selección Mexicana.

* `gold.fact_mexico_matches`

Contiene información transformada para el análisis de los partidos de México, incluyendo:

* Fecha del partido.
* Año.
* Rival.
* Torneo.
* Tipo de sede.
* Goles a favor.
* Goles en contra.
* Diferencia de goles.
* Resultado.

---

## 🔄 Procesamiento Incremental

El pipeline incorpora una estrategia incremental para evitar volver a considerar como nuevos partidos aquellos que ya existen.

La comparación se realiza mediante `match_key`:

```text
date|home_team|away_team|tournament
```

La lógica fue validada mediante dos escenarios:

1. Comparación del conjunto actual consigo mismo:

   * 1,008 partidos existentes.
   * 0 partidos nuevos.

2. Incorporación de un partido sintético:

   * 1,008 partidos existentes.
   * 1 partido nuevo detectado.
   * La detección se realizó mediante `match_key`.

Esto permite mantener una lógica de ingestión **idempotente a nivel de partido**, sin depender del `match_id` secuencial.

> El pipeline está preparado para procesamiento incremental, pero la actualización de la fuente y la ejecución del pipeline siguen siendo pasos realizados de forma controlada; no se presenta como un sistema de producción completamente autónomo.

---

## 🛠️ Stack Tecnológico

### Data Engineering

* Python
* Pandas
* Jupyter Notebook

### Data Warehouse

* Google BigQuery

### SQL

* BigQuery SQL

### Visualización

* Tableau Public

### Control de Versiones

* Git
* GitHub

### Comunicación

* LinkedIn

---

## 📓 Pipeline

Los notebooks principales del proyecto son:

```text
notebooks/

├── 001_data_ingestion.ipynb
├── 002_bronze_raw_matches.ipynb
├── 003_silver_matches.ipynb
└── 004_bigquery_incremental.ipynb
```

### 001 — Data Ingestion

Carga y preparación inicial del dataset histórico.

### 002 — Bronze

Construcción de la capa Bronze a partir de los datos de entrada.

### 003 — Silver

Limpieza, transformación, generación de `match_key` y validación de calidad de los partidos.

### 004 — BigQuery Incremental

Integración con BigQuery y procesamiento incremental de los datos.

La automatización actualmente implementada se considera **finalizada para el alcance de datos de partidos**.

---

## 📂 Estructura del Proyecto

```text
mexico2030-analytics/

├── docs/
│   ├── Project_Master.md
│   ├── Architecture.md
│   ├── Data_Dictionary.md
│   └── CHANGELOG.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 001_data_ingestion.ipynb
│   ├── 002_bronze_raw_matches.ipynb
│   ├── 003_silver_matches.ipynb
│   └── 004_bigquery_incremental.ipynb
│
├── dashboard/
│
└── README.md
```

---

## 🔎 Calidad de Datos

Durante la construcción del pipeline se realizaron validaciones sobre la capa Silver y el modelo de partidos de México.

Entre las validaciones realizadas se incluyen:

* Registros duplicados.
* `match_key` duplicadas.
* Valores nulos en claves.
* Unicidad de `match_id`.
* Conteo total de registros.
* Conteo de partidos de México.
* Consistencia del subconjunto de México.
* Detección de nuevos registros mediante `match_key`.

Estado validado de Silver:

```text
49,501 partidos
49,501 match_key únicas
0 match_key duplicadas
0 match_key nulas
49,501 match_id únicos
```

Estado validado para México:

```text
1,008 partidos
```

---

## 📈 Dashboard V1

El dashboard actual se encuentra publicado en Tableau Public.

### KPIs

* Partidos jugados.
* Victorias.
* Empates.
* Derrotas.
* Porcentaje de victorias.

### Visualizaciones

* Rendimiento histórico por año.
* Resultados por competición.
* Rendimiento como local, visitante y en sede neutral.
* Principales rivales por número de enfrentamientos.

### Dashboard

https://public.tableau.com/app/profile/carlos.borja1355/viz/Mexico2030_Analytics_V1_twb/RendimientodeMxicoporAo

---

## 🚀 Estado Actual del Proyecto

### Estado

**Pipeline de partidos y Dashboard V1 completados.**

### Componentes finalizados

* Infraestructura BigQuery.
* Arquitectura Bronze / Silver / Gold.
* Ingesta y procesamiento histórico.
* Capa Silver.
* Modelo Gold de partidos de México.
* Validaciones de calidad de datos.
* Estrategia incremental mediante `match_key`.
* Integración con BigQuery.
* Notebook `004_bigquery_incremental.ipynb`.
* Dashboard Tableau V1.
* Publicación inicial del análisis.

### Siguiente fase

**Jugadores**

La siguiente etapa del proyecto se enfocará en incorporar datos de jugadores y construir un modelo analítico específico para posteriormente desarrollar indicadores y un dashboard de jugadores.

---

## 🗺️ Roadmap

### ✅ Fase 1 — Datos históricos y MVP

* Dataset histórico.
* Arquitectura Bronze / Silver / Gold.
* Procesamiento con Python y Pandas.
* Modelo Silver.
* Modelo Gold de partidos de México.
* Validaciones de calidad.
* Dashboard Tableau V1.

### ✅ Fase 2 — Integración e incrementalidad

* Integración con BigQuery.
* Reconstrucción de Silver y Gold en BigQuery.
* Detección incremental mediante `match_key`.
* Validación de idempotencia.
* Validaciones finales del pipeline.

### 🔄 Fase 3 — Datos de jugadores

* Incorporación de datos de jugadores.
* Construcción de la capa analítica correspondiente.
* Definición de métricas y KPIs de jugadores.
* Dashboard de jugadores.

### ⬜ Fase 4 — Analytics avanzado

* Nuevas métricas históricas.
* Análisis por rival.
* Análisis por torneo.
* Métricas por periodos.
* Extensión de modelos Gold según necesidades analíticas.

### ⬜ Fase 5 — México rumbo al Mundial 2030

* Seguimiento de nuevos partidos.
* Actualización periódica del modelo.
* Análisis post-partido.
* Evolución de dashboards.
* Nuevos análisis orientados al ciclo mundialista.

---

## 👨‍💻 Autor

**Carlos Borja**

Data Analyst | Sports Analytics

LinkedIn:

https://www.linkedin.com/in/carlos-borja-analista

GitHub:

https://github.com/cabn030399

---

## ⚽ México2030 Analytics

Un proyecto de análisis de datos deportivos que integra **Python, SQL, BigQuery y Tableau** para transformar resultados históricos de la Selección Mexicana en información analítica reproducible y visualmente accesible.

El proyecto evoluciona progresivamente desde el análisis histórico de partidos hacia modelos de jugadores y nuevos casos de uso analítico relacionados con el camino hacia 2030.
