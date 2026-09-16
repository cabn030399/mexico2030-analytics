# Architecture — México2030 Analytics

## 1. Objetivo

La arquitectura de **México2030 Analytics** está diseñada para transformar resultados históricos de partidos de fútbol en datos estructurados, validados y preparados para análisis.

El flujo actual separa las etapas de:

* Ingesta
* Bronze
* Silver
* Procesamiento incremental
* BigQuery
* Gold
* Visualización

El objetivo es mantener una separación clara entre datos de origen, datos procesados y datos analíticos.

---

# 2. Arquitectura Actual

```text
Dataset histórico
       │
       ▼
001_data_ingestion.ipynb
       │
       ▼
002_bronze_raw_matches.ipynb
       │
       ▼
003_silver_matches.ipynb
       │
       ▼
004_bigquery_incremental.ipynb
       │
       ▼
BigQuery Staging
       │
       ▼
Silver BigQuery
       │
       ▼
Gold
       │
       ▼
Tableau Public
```

La arquitectura actual cubre el pipeline de datos de partidos y su preparación para análisis.

---

# 3. Fuente de Datos

Fuente principal:

**International Football Results from 1872 to 2026**

Autor:

**Mart Jürisoo — Kaggle**

Estructura original:

```text
date
home_team
away_team
home_score
away_score
tournament
city
country
neutral
```

El dataset contiene resultados históricos internacionales.

Los registros sin marcador se conservan inicialmente en Bronze, pero se excluyen de Silver al no representar partidos con resultado disponible.

---

# 4. Bronze Layer

La capa Bronze representa los datos de origen con transformaciones mínimas.

Notebook:

```text
002_bronze_raw_matches.ipynb
```

Tabla asociada en BigQuery:

```text
bronze.raw_matches
```

Infraestructura Bronze disponible:

```text
bronze.raw_matches
bronze.raw_players
bronze.raw_rankings
```

### Características

* Conservación del origen de los datos.
* Estructura orientada a mantener trazabilidad.
* Separación entre datos crudos y datos transformados.

El pipeline actual de partidos utiliza principalmente el flujo de `raw_matches`.

---

# 5. Silver Layer

La capa Silver contiene los partidos procesados y preparados para análisis.

Notebook:

```text
003_silver_matches.ipynb
```

Tabla en BigQuery:

```text
silver.matches
```

## Transformaciones principales

* Conversión y normalización de fechas.
* Eliminación de registros sin marcador.
* Generación de identificadores.
* Construcción de `match_key`.
* Validación de duplicados.
* Preparación de los campos para almacenamiento analítico.

### Estructura principal

```text
match_id
match_key
date
home_team
away_team
home_score
away_score
tournament
city
country
neutral
```

### `match_key`

La clave lógica utilizada para identificar un partido es:

```text
date|home_team|away_team|tournament
```

Esta clave permite detectar partidos ya procesados independientemente del valor secuencial de `match_id`.

---

# 6. Procesamiento Incremental

El procesamiento incremental se implementó mediante:

```text
004_bigquery_incremental.ipynb
```

Su función es identificar qué registros representan partidos nuevos respecto a los datos existentes.

El criterio principal de comparación es:

```text
match_key
```

y no:

```text
match_id
```

## Validación de idempotencia

Se realizó una prueba comparando el conjunto actual de México contra sí mismo:

```text
Partidos existentes: 1008
Partidos nuevos: 0
```

Esto valida que ejecutar nuevamente el proceso sobre los mismos datos no genere nuevos registros.

## Validación con partido sintético

También se agregó un registro de prueba:

```text
2026-08-28|Mexico|Test Team|Test Tournament
```

con marcador:

```text
2 - 1
```

El proceso detectó:

```text
Partidos existentes: 1008
Partidos nuevos detectados: 1
```

Esto valida que un registro con una `match_key` nueva sea identificado como nuevo.

### Alcance actual

El proceso incremental está implementado y validado para el pipeline actual.

No se presenta como un sistema autónomo de producción ni como una actualización continua sin intervención. La actualización de los datos y la ejecución del pipeline siguen siendo pasos controlados.

---

# 7. BigQuery

BigQuery funciona como capa de almacenamiento y consulta analítica del proyecto.

Datasets:

```text
bronze
silver
gold
```

## Tablas principales

### Bronze

```text
bronze.raw_matches
bronze.raw_players
bronze.raw_rankings
```

### Silver

```text
silver.matches
```

### Gold

```text
gold.fact_mexico_matches
```

La separación por datasets permite mantener diferenciadas las capas de procesamiento.

---

# 8. Gold Layer

La capa Gold contiene datos preparados específicamente para el análisis de la selección mexicana masculina.

Tabla:

```text
gold.fact_mexico_matches
```

## Transformaciones

* Filtrado de partidos de México.
* Identificación del rival.
* Derivación del año.
* Clasificación de localía.
* Cálculo de goles a favor.
* Cálculo de goles en contra.
* Cálculo de diferencia de goles.
* Clasificación del resultado.

## Estructura principal

```text
match_id
match_date
year
opponent
tournament
venue_type
goals_for
goals_against
goal_difference
result
```

La tabla contiene actualmente:

```text
1008 partidos de México
```

---

# 9. Validaciones de Calidad

La arquitectura incorpora controles para comprobar la consistencia de los datos.

Validaciones realizadas:

```text
Total de registros Silver: 49,501
Mexico en Silver: 1,008
match_id únicos: 49,501
match_key duplicadas: 0
Registros involucrados en duplicados: 0
```

También se validó que la `match_key` de los partidos de México no presente valores nulos.

Estas comprobaciones forman parte del control de calidad antes de utilizar los datos para análisis y visualización.

---

# 10. Dashboard Tableau V1

Fuente:

```text
gold.fact_mexico_matches
```

Herramienta:

**Tableau Public**

## KPIs

* Partidos Jugados
* Victorias
* Empates
* Derrotas
* % Victorias

## Visualizaciones

* Rendimiento Histórico por Año
* Resultados por Competición
* Home / Away / Neutral
* Top 10 Rivales

Estado:

```text
Publicado en Tableau Public
```

El dashboard representa la primera capa de consumo analítico del proyecto.

---

# 11. Cobertura de Datos

| Métrica                  | Valor      |
| ------------------------ | ---------- |
| Primer partido de México | 1923-01-01 |
| Último partido de México | 2026-07-05 |
| Total partidos de México | 1008       |

La cobertura corresponde al subconjunto de partidos de México utilizado en la capa Gold.

---

# 12. Estado Actual de la Arquitectura

Actualmente se encuentran implementados y validados:

* Ingesta del dataset histórico.
* Capa Bronze.
* Capa Silver.
* Generación de `match_key`.
* Validación de duplicados.
* Procesamiento incremental.
* Validación de idempotencia.
* Integración con BigQuery.
* Tabla `silver.matches`.
* Tabla `gold.fact_mexico_matches`.
* Dashboard Tableau V1.

La automatización del pipeline de partidos se considera **completada dentro del alcance actual del proyecto**.

Esto no implica una plataforma productiva completamente autónoma. La ejecución del pipeline y la actualización del origen siguen siendo procesos controlados.

---

# 13. Arquitectura Planeada

La siguiente evolución de la arquitectura estará orientada principalmente a los datos de jugadores.

## Bronze

Infraestructura disponible:

```text
raw_matches
raw_rankings
raw_players
```

## Silver

Evolución prevista:

```text
matches
rankings
players
```

## Gold

Evolución prevista:

```text
fact_mexico_matches
fact_fifa_ranking
fact_players_pool
```

Estas capas adicionales forman parte de la evolución del proyecto y no deben interpretarse como tablas analíticas actualmente implementadas si todavía no han sido construidas.

---

# 14. Evolución Planeada

## Fase 1 — Pipeline de Partidos

Estado:

**Completado**

Incluye:

* Ingesta histórica.
* Bronze.
* Silver.
* Gold.
* BigQuery.
* Procesamiento incremental.
* Validaciones.
* Dashboard Tableau V1.

---

## Fase 2 — Datos de Jugadores

Siguiente fase principal del proyecto.

Objetivos:

* Incorporar datos de jugadores.
* Diseñar el modelo Silver correspondiente.
* Construir el modelo Gold de jugadores.
* Definir KPIs individuales.
* Preparar la información para análisis y visualización.

---

## Fase 3 — Analytics Avanzado

Posibles líneas de análisis:

* Rendimiento por década.
* Rendimiento por rival.
* Rendimiento por torneo.
* Evolución histórica.
* Comparaciones entre periodos.
* Análisis individual de jugadores.

---

## Fase 4 — Evolución del Dashboard

Posibles mejoras:

* Filtros globales.
* Mejoras de navegación.
* Storytelling ejecutivo.
* Nuevas métricas.
* Integración de análisis de jugadores.

Estas mejoras se implementarán después de consolidar el modelo de datos correspondiente.

---

# 15. Principios de Arquitectura

El proyecto sigue los siguientes principios:

### Separación por capas

Los datos crudos, procesados y analíticos se mantienen separados.

### Trazabilidad

Cada transformación debe poder relacionarse con una etapa identificable del pipeline.

### Calidad de datos

Las transformaciones se acompañan de validaciones para detectar duplicados, registros inválidos y problemas de consistencia.

### Idempotencia

La identificación de nuevos partidos se basa en `match_key`, evitando depender de identificadores secuenciales para determinar si un registro ya existe.

### Simplicidad

La arquitectura busca resolver las necesidades actuales sin introducir componentes innecesarios.

### Evolución incremental

Las nuevas capacidades se incorporan por fases, comenzando por la consolidación de los datos de partidos y continuando con jugadores y analytics avanzado.

---

# 16. Principio Rector

> Un análisis publicado vale más que un análisis perfecto que nunca se publica.
