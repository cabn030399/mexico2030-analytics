# Changelog

# 🇲🇽 México2030 Analytics

Registro oficial de cambios del proyecto.

---

# v1.1.0 — Dashboard Histórico Avanzado

**Fecha:** Julio 2026

## Añadido

### Nuevo Dashboard Histórico Avanzado

Construcción del segundo dashboard especializado utilizando exclusivamente la tabla:

`gold.fact_mexico_matches`

### KPIs

- Partidos Jugados
- Goles Anotados
- Goles Recibidos
- Promedio de Goles Anotados
- Promedio de Goles Recibidos

### Visualizaciones

- Evolución de Goles Anotados vs Goles Recibidos por Año
- Top 10 Rivales con Más Goles Anotados
- Top 10 Rivales con Más Goles Recibidos
- Goles Anotados por Competición
- Goles Recibidos por Competición
- Rendimiento Ofensivo y Defensivo por Localía

## Decisiones Arquitectónicas

- Se mantuvo una única fuente de datos (`gold.fact_mexico_matches`).
- No se incorporaron nuevas tablas ni nuevas fuentes.
- Se reutilizó la identidad visual del Dashboard Ejecutivo para mantener consistencia.
- El análisis geográfico quedó pospuesto para futuras versiones al requerir nuevas dimensiones de datos.

## Resultado

✅ Dashboard publicado en Tableau Public.

---

# v1.0.0 — MVP Completado

**Fecha:** Julio 2026

## Añadido

### Arquitectura

- BigQuery Bronze
- BigQuery Silver
- BigQuery Gold

### Data Engineering

- ETL desarrollado con Python
- Construcción de `gold.fact_mexico_matches`

### Dashboard Ejecutivo

#### KPIs

- Partidos Jugados
- Victorias
- Empates
- Derrotas
- % Victorias

#### Visualizaciones

- Rendimiento Histórico por Año
- Resultados por Competición
- Top 10 Rivales Más Enfrentados
- Rendimiento Home / Away / Neutral

## Resultado

Cobertura validada:

- Primer partido: 1923-01-01
- Último partido: 2026-07-05
- Total partidos: 1008

Estado:

✅ MVP COMPLETADO

---

# v0.4.0 — Gold Layer

**Fecha:** Julio 2026

## Añadido

- Creación de `gold.fact_mexico_matches`
- Definición oficial de la granularidad:
  - 1 fila = 1 partido de México
- Construcción de métricas analíticas para Tableau

Estado:

✅ Completado

---

# v0.3.0 — Silver Layer

**Fecha:** Julio 2026

## Añadido

- Eliminación de registros sin marcador
- Validación de duplicados
- Creación de `match_id`
- Construcción de `silver.matches`

Resultado:

49,501 registros válidos para análisis.

Estado:

✅ Completado

---

# v0.2.0 — Data Ingestion

**Fecha:** Julio 2026

## Añadido

- Notebook `001_data_ingestion.ipynb`
- Exploración inicial del dataset
- Validación de calidad
- Primera carga hacia BigQuery

Hallazgos:

- 49,505 registros históricos
- 1,008 partidos correspondientes a México

Estado:

✅ Completado

---

# v0.1.0 — Fundación del Proyecto

**Fecha:** Julio 2026

## Añadido

- Definición de visión
- Objetivos estratégicos
- Alcance del proyecto
- Selección del stack tecnológico
- Creación del repositorio GitHub
- Creación de la documentación inicial
- Definición de la arquitectura Bronze / Silver / Gold
- Selección del dataset oficial

### Dataset Oficial

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo (Kaggle)

Archivos:

- results.csv
- goalscorers.csv
- shootouts.csv
- former_names.csv

Estado:

✅ Proyecto iniciado

---

# Auditorías de Calidad

Durante la construcción del Dashboard Ejecutivo se realizaron auditorías completas para validar la consistencia de las métricas por competición.

## Competiciones auditadas

- Gold Cup
- FIFA World Cup
- FIFA World Cup Qualification
- Copa América
- CONCACAF Nations League
- Friendly

## Validaciones realizadas

- Partidos jugados
- Victorias
- Empates
- Derrotas
- Porcentaje de victorias
- Distribución por localía
- Top rivales históricos
- Consistencia entre SQL, BigQuery y Tableau

## Decisión aprobada

Como estándar oficial del proyecto se utilizarán filtros exactos sobre el campo `tournament`.

Ejemplo:

```sql
WHERE tournament = 'FIFA World Cup'
```

Evitando expresiones como:

```sql
LIKE '%World Cup%'
```

para impedir mezclar competiciones con nombres similares.

Resultado:

✅ Todas las auditorías fueron aprobadas satisfactoriamente.
