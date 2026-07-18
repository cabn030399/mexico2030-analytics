# Architecture Document
# 🇲🇽 México2030 Analytics

Última actualización: Julio 2026

---

# 1. Objetivo

Definir la arquitectura de datos implementada para México2030 Analytics.

La arquitectura está diseñada para soportar el análisis histórico de la Selección Mexicana de Fútbol y servir como base para futuras automatizaciones rumbo al Mundial 2030.

Principios:

- Simplicidad
- Escalabilidad
- Bajo costo
- Fácil mantenimiento
- Orientación a portafolio profesional

---

# 2. Arquitectura General

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

# 3. Stack Tecnológico

## Desarrollo

- Python
- Pandas
- Jupyter Notebook
- VS Code
- Anaconda

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

# 4. Fuente Oficial del MVP

## Dataset

International Football Results from 1872 to 2026

## Autor

Mart Jürisoo

## Plataforma

Kaggle

## Archivo utilizado

results.csv

---

# 5. Proyecto BigQuery

Proyecto:

```text
mexico2030analytics
```

---

# 6. Datasets

## Bronze

Datos sin transformación.

Tablas:

- raw_matches

---

## Silver

Datos limpios y normalizados.

Tablas:

- matches

---

## Gold

Datos listos para análisis.

Tablas:

- fact_mexico_matches

---

# 7. Flujo de Datos

## Bronze Layer

Carga inicial desde Kaggle.

Resultado:

- raw_matches

---

## Silver Layer

Transformaciones:

- Limpieza de datos
- Eliminación de duplicados
- Estandarización
- Generación de match_id

Resultado:

- matches

---

## Gold Layer

Transformaciones:

- Filtrado exclusivo de México
- Construcción de KPIs
- Variables analíticas

Resultado:

- fact_mexico_matches

---

# 8. Dashboard Tableau V1

Fuente:

```text
gold.fact_mexico_matches
```

KPIs:

- Partidos Jugados
- Victorias
- Empates
- Derrotas
- % Victorias

Visualizaciones:

- Rendimiento Histórico por Año
- Resultados por Competición
- Home / Away / Neutral
- Top 10 Rivales

Estado:

✅ Publicado en Tableau Public

---

# 9. Cobertura de Datos

| Métrica | Valor |
|----------|----------|
| Primer partido | 1923-01-01 |
| Último partido | 2026-07-05 |
| Total partidos | 1008 |

---

# 10. Arquitectura Futura

## Bronze

- raw_matches
- raw_rankings
- raw_players

## Silver

- matches
- rankings
- players

## Gold

- fact_mexico_matches
- fact_fifa_ranking
- fact_players_pool

---

# 11. Evolución Planeada

## Sprint 6

Dashboard V1.1

- Filtros globales
- Mejoras visuales
- Storytelling ejecutivo

---

## Sprint 7

Analytics Avanzado

- Rendimiento por década
- Rendimiento por rival
- Rendimiento por torneo

---

## Sprint 8

Automatización

- APIs
- ETL automatizado
- Actualización continua

---

# 12. Principio Rector

> Un análisis publicado vale más que un análisis perfecto que nunca se publica.
