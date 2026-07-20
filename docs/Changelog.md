# Changelog

# Camino al Mundial 2030

---

## v0.1.0 - Fundación del Proyecto

Fecha: Julio 2026

### Completado

* Definición de visión del proyecto.
* Definición de objetivos estratégicos.
* Definición de alcance.
* Exclusión de Selección Femenil del MVP.
* Selección de stack tecnológico.
* Creación del repositorio GitHub.
* Creación de Project_Master.md.
* Creación de Architecture.md.
* Creación de Data_Dictionary.md.
* Creación de datasets Bronze, Silver y Gold.
* Selección del dataset histórico oficial.
* Descarga de resultados internacionales históricos.

### Dataset Oficial MVP

International Football Results from 1872 to 2026

Autor:
Mart Jürisoo

Fuente:
Kaggle

Archivos:

* results.csv
* goalscorers.csv
* shootouts.csv
* former_names.csv

### Estado

Fase de Planificación:
✅ Completada

Fase de Infraestructura:
✅ Completada

Fase de Desarrollo:
⏳ En progreso

---

## Próxima Versión

v0.2.0

Objetivos:

* Crear notebook 001_data_ingestion.ipynb
* Explorar results.csv
* Construir primera carga hacia BigQuery
* Crear tabla bronze.raw_matches
## [v0.2.0] - 2026-07-11
### Añadido
- Notebook creado: `notebooks/001_data_ingestion.ipynb`
- Objetivo: Exploración inicial y análisis de calidad del dataset histórico de resultados internacionales.
- Estado: Completado exitosamente.
- Hallazgos clave: 49,505 registros totales y 1,008 partidos identificados de la Selección de México.
DA-013

Se identificaron 4 registros con home_score y away_score nulos.

Corresponden a partidos proyectados del Mundial FIFA 2026.

Decisión:
Mantener registros en Bronze.
Excluir registros sin marcador en Silver y Gold.

Estado:
Aprobado.
## DA-015

Fecha: 2026-07-13

Sprint 3 - Silver Layer

Acciones:

- Eliminados 4 registros sin marcador.
- Validación de duplicados completada.
- Creado match_id.
- Generado matches_silver.csv.

Resultado:

silver.matches contiene 49,501 registros válidos para análisis.

Estado:

Aprobado.
---

## [v0.3.0] - 2026-07-14

### Sprint 4 - Gold Layer

#### Añadido

- Creación de la tabla `gold.fact_mexico_matches`.
- Definición oficial de la granularidad:
  - 1 fila = 1 partido de México.
- Construcción de métricas analíticas para Tableau.

#### Resultado

Cobertura validada:

- Primer partido: 1923-01-01
- Último partido: 2026-07-05
- Total partidos: 1008

#### Estado

✅ Completado

---

## [v0.4.0] - 2026-07-15

### Sprint 5 - Dashboard Tableau V1

#### Añadido

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
- Top 10 Rivales Más Enfrentados

#### Resultado

Dashboard publicado en Tableau Public.

#### Estado

✅ Completado

---

## [v0.5.0] - 2026-07-16

### Cierre Oficial MVP

#### Completado

- BigQuery Bronze Layer
- BigQuery Silver Layer
- BigQuery Gold Layer
- fact_mexico_matches
- Dashboard Tableau V1
- Publicación inicial en LinkedIn
- Documentación técnica completa

#### Resultado

México2030 Analytics alcanza el estado:

✅ MVP COMPLETADO

Versión:

v0.1.0

Cobertura:

- 1008 partidos
- 1923–2026

#### Estado

✅ Cerrado
v1.1.1
- Corregido filtro residual en visualización Top 10 Rivales.
- Validación completa de métricas Gold Cup.
- Auditoría de calidad completada (9/9 verificaciones aprobadas).
- # Changelog

## México2030 Analytics

---

# v1.1.2 — Auditoría FIFA World Cup completada

**Fecha:** 19 de julio de 2026

## Validaciones agregadas

Se completó la auditoría de calidad de datos para la competición:

* FIFA World Cup

Métricas verificadas:

* Partidos jugados
* Victorias
* Empates
* Derrotas
* Porcentaje de victorias
* Distribución por sede
* Top 10 rivales históricos

---

## Hallazgos corregidos

### Filtro de competición

Se detectó que consultas con:

```sql
LIKE '%World Cup%'
```

mezclaban:

* FIFA World Cup
* FIFA World Cup qualification

Se estableció como estándar utilizar filtros exactos por competición.

---

## Resultado auditoría

FIFA World Cup:

* 65 partidos
* 21 victorias
* 15 empates
* 29 derrotas
* 32.31% victorias

Estado:

✅ Datos validados

---

## Mejoras futuras

Pendiente optimización visual del componente:

* Top 10 Rivales

Objetivo:

Mostrar exactamente 10 elementos en Tableau manteniendo el ranking correcto.

---

Próximo bloque de auditoría:

* Eliminatorias Mundialistas
* Copa América
* Nations League
* Amistosos
* # Changelog

## México2030 Analytics

---

# v1.1.3 — Auditoría Copa América completada

**Fecha:** 19 de julio de 2026

## Validaciones agregadas

Se completó la auditoría de calidad de datos para:

* Copa América

Métricas verificadas:

* Partidos jugados
* Victorias
* Empates
* Derrotas
* Porcentaje de victorias
* Distribución por sede
* Top 10 rivales históricos

---

## Resultados confirmados

Copa América:

* 51 partidos
* 20 victorias
* 14 empates
* 17 derrotas
* 39.21% victorias

---

## Resultado auditoría

Estado:

✅ Datos validados

Score:

9/9 validaciones aprobadas

---

## Observaciones

Se confirmó nuevamente la importancia de utilizar filtros exactos de competición dentro del campo `tournament`.

Estándar aprobado:

```sql
WHERE tournament = 'Nombre exacto del torneo'
```

---

Próximas auditorías pendientes:

* Eliminatorias Mundialistas
* Confederaciones Cup
* Nations League
* Amistosos


