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
