# Changelog

# México2030 Analytics

Registro de cambios, decisiones técnicas y avances relevantes del proyecto.

---

## v0.1.0 — Fundación del Proyecto

**Fecha:** Julio 2026

### Completado

* Definición de la visión del proyecto.
* Definición de objetivos estratégicos.
* Definición del alcance.
* Exclusión de la Selección Femenil del alcance inicial.
* Selección del stack tecnológico.
* Creación del repositorio GitHub.
* Creación de `Project_Master.md`.
* Creación de `Architecture.md`.
* Creación de `Data_Dictionary.md`.
* Definición de las capas Bronze, Silver y Gold.
* Selección del dataset histórico.
* Descarga del dataset de resultados internacionales.

### Dataset utilizado

**International Football Results from 1872 to 2026**

Autor:

**Mart Jürisoo**

Fuente:

**Kaggle**

Archivos disponibles en el dataset:

* `results.csv`
* `goalscorers.csv`
* `shootouts.csv`
* `former_names.csv`

Para el pipeline actual de partidos se utiliza principalmente:

```text
results.csv
```

### Estado

* Fase de Planificación: completada.
* Fase de Infraestructura: completada.
* Fase de Desarrollo: iniciada.

---

## v0.2.0 — Data Ingestion

**Fecha:** 2026-07-11

### Añadido

* Notebook creado:
  `notebooks/001_data_ingestion.ipynb`
* Exploración inicial del dataset histórico.
* Validación inicial de estructura y tipos de datos.
* Identificación de registros correspondientes a México.

### Resultado

Dataset original:

```text
49,505 registros
9 columnas
```

Partidos identificados de México:

```text
1,008
```

### DA-013 — Registros sin marcador

Se identificaron:

```text
4 registros
```

con `home_score` y `away_score` nulos.

### Decisión

* Mantener los registros en Bronze como parte del origen.
* Excluir los registros sin marcador de Silver.
* No utilizarlos para las métricas de Gold.

### Estado

✅ Aprobado

---

## DA-015 — Silver Layer

**Fecha:** 2026-07-13

### Sprint 3 — Silver Layer

### Acciones

* Creación del notebook:
  `notebooks/003_silver_matches.ipynb`
* Eliminación de los 4 registros sin marcador para la capa Silver.
* Conversión y normalización de fechas.
* Creación de `match_id`.
* Generación de `match_key`.
* Validación de duplicados.
* Construcción del dataset Silver.

### Resultado

La capa Silver contiene:

```text
49,501 registros válidos
```

La clave lógica utilizada para identificar partidos es:

```text
date|home_team|away_team|tournament
```

### Validaciones

```text
match_key duplicadas: 0
Registros involucrados en duplicados: 0
match_id únicos: 49,501
```

### Estado

✅ Aprobado

---

## v0.3.0 — Gold Layer

**Fecha:** 2026-07-14

### Sprint 4 — Gold Layer

### Añadido

* Creación de la tabla:

```text
gold.fact_mexico_matches
```

* Definición de la granularidad:

  * 1 fila = 1 partido de México.
* Filtrado de los partidos correspondientes a México.
* Construcción de variables analíticas.
* Preparación de métricas para Tableau.

### Resultado

Cobertura validada:

| Métrica                  |      Valor |
| ------------------------ | ---------: |
| Primer partido de México | 1923-01-01 |
| Último partido de México | 2026-07-05 |
| Total de partidos        |      1,008 |

### Estado

✅ Completado

---

## v0.4.0 — Dashboard Tableau V1

**Fecha:** 2026-07-15

### Sprint 5 — Dashboard Tableau V1

### Añadido

#### KPIs

* Partidos Jugados
* Victorias
* Empates
* Derrotas
* % Victorias

#### Visualizaciones

* Rendimiento por Año.
* Resultados por Competición.
* Home vs Away vs Neutral.
* Top 10 Rivales Más Enfrentados.

### Resultado

Dashboard publicado en Tableau Public.

### Estado

✅ Completado

---

## v0.5.0 — Integración BigQuery y Procesamiento Incremental

**Fecha:** Julio 2026

### Objetivo

Evolucionar el pipeline desde un procesamiento histórico hacia un flujo capaz de identificar nuevos partidos sin depender de la regeneración completa del dataset analítico.

### Añadido

* Integración del entorno Python con BigQuery.
* Creación y validación de datasets:

  * `bronze`
  * `silver`
  * `gold`
* Integración de la tabla:

```text
silver.matches
```

* Validación de la tabla:

```text
gold.fact_mexico_matches
```

* Creación del notebook:

```text
notebooks/004_bigquery_incremental.ipynb
```

* Implementación de detección incremental basada en `match_key`.
* Separación entre registros existentes y registros nuevos.
* Reconstrucción controlada de Silver y Gold durante la integración.
* Validaciones finales de consistencia.

### Estrategia incremental

La comparación utiliza:

```text
match_key
```

en lugar de depender de:

```text
match_id
```

Esto permite determinar si un partido ya existe mediante una clave lógica estable.

### Validación de idempotencia

Se comparó el conjunto actual de México contra sí mismo:

```text
Partidos existentes: 1008
Partidos nuevos: 0
```

Resultado:

```text
No se detectaron nuevos partidos.
```

### Validación con registro sintético

Se añadió un partido de prueba con:

```text
match_key:
2026-08-28|Mexico|Test Team|Test Tournament
```

Resultado:

```text
Partidos existentes: 1008
Partidos nuevos detectados: 1
```

Esto permitió validar que un partido con una `match_key` nueva es identificado correctamente como registro incremental.

### Estado

✅ Implementado y validado

### Limitación actual

El proceso incremental está implementado para el alcance actual del proyecto, pero no se presenta como un sistema autónomo de producción.

La actualización del origen de datos y la ejecución del pipeline siguen siendo procesos controlados.

---

## Validaciones Finales del Pipeline

Como parte del cierre de la etapa de automatización de partidos se realizaron validaciones sobre las capas principales.

### Silver

```text
Registros: 49,501
match_id únicos: 49,501
match_key duplicadas: 0
Registros involucrados en duplicados: 0
```

### México

```text
Partidos de México: 1,008
```

### Gold

```text
gold.fact_mexico_matches: 1,008 registros
```

### Estado

✅ Pipeline de partidos validado

---

# Estado Actual del Proyecto

La etapa correspondiente al **pipeline de partidos** se considera completada dentro del alcance definido.

Actualmente se encuentran implementados:

* Data ingestion.
* Bronze.
* Silver.
* `match_key`.
* Validación de duplicados.
* Procesamiento incremental.
* Validación de idempotencia.
* Integración con BigQuery.
* Silver en BigQuery.
* Gold en BigQuery.
* `gold.fact_mexico_matches`.
* Dashboard Tableau V1.
* Documentación técnica.

### Estado general

✅ **Pipeline de partidos completado**

✅ **Dashboard V1 publicado**

⏳ **Siguiente fase: Datos de Jugadores**

---

# Próxima Fase

## Jugadores

La siguiente etapa del proyecto estará enfocada en incorporar información de jugadores y construir una capa analítica que permita complementar el análisis histórico de partidos.

Objetivos previstos:

* Incorporar datos de jugadores.
* Diseñar el modelo Silver correspondiente.
* Construir el modelo Gold de jugadores.
* Definir KPIs individuales.
* Preparar análisis y visualizaciones de jugadores.

Estas funcionalidades todavía forman parte de la evolución futura del proyecto y no deben interpretarse como componentes ya implementados.

---

# Principios del Changelog

Este documento registra:

* Cambios implementados.
* Decisiones técnicas relevantes.
* Validaciones realizadas.
* Limitaciones conocidas.
* Evolución prevista del proyecto.

Las funcionalidades futuras se mantienen separadas de las funcionalidades ya implementadas para evitar confundir el estado planificado con el estado real del sistema.

