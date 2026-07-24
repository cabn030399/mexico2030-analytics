# 🇲🇽 México2030 Analytics

## Tricolor Analytics

Proyecto de Sports Analytics enfocado en analizar el rendimiento histórico de la Selección Mexicana de Fútbol mediante técnicas de Data Analytics, Data Engineering y Business Intelligence.

El objetivo es construir una plataforma de análisis que permita estudiar la evolución de México rumbo al Mundial 2030 y generar insights basados en datos para comprender tendencias, fortalezas y oportunidades de mejora del equipo nacional.

---

# 🔗 Enlaces

## 📊 Dashboards Tableau Public

### Dashboard Ejecutivo

https://public.tableau.com/app/profile/carlos.borja1355/viz/Mexico2030_Analytics_V1_twb/RendimientodeMxicoporAo

### Dashboard Histórico Avanzado

https://public.tableau.com/app/profile/carlos.borja1355/viz/DashboardRendimientoOfensivo-Defensivo/DashboardRendimientoOfensivo-Defensivo

## 💼 LinkedIn

https://www.linkedin.com/in/carlos-borja-analista

## 💻 GitHub

https://github.com/cabn030399

---

# 📸 Dashboards

## Dashboard Ejecutivo
$<img width="1366" height="768" alt="Captura de pantalla (209)" src="https://github.com/user-attachments/assets/03ab2458-f8cd-49a1-baa1-aaa615b97eb9" />

## Dashboard Histórico Avanzado

$<img width="1366" height="768" alt="Captura de pantalla (208)" src="https://github.com/user-attachments/assets/a04c6a40-8865-422b-bd32-32c7c6c206ef" />

---

# 🎯 Objetivo del Proyecto

Responder preguntas como:

- ¿Cómo ha evolucionado el rendimiento histórico de la Selección Mexicana?
- ¿Contra qué rivales obtiene mejores resultados?
- ¿En qué competiciones presenta mejor desempeño?
- ¿Cómo cambia el rendimiento según la localía?
- ¿Cómo ha evolucionado ofensiva y defensivamente a lo largo del tiempo?
- ¿Qué tendencias pueden identificarse rumbo al Mundial 2030?

---

# 📊 Alcance Actual

## Incluido

- Selección Mexicana Mayor Masculina
- Resultados históricos oficiales
- Arquitectura Bronze / Silver / Gold
- Procesos ETL con Python
- Data Warehouse en BigQuery
- Dashboards interactivos en Tableau Public
- Publicación de análisis en LinkedIn

## Fuera del alcance actual

- Selección Femenil
- Selecciones menores
- APIs deportivas
- Automatización del pipeline
- Machine Learning
- Modelos predictivos

---

# 📂 Dataset Oficial

## Fuente Principal

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo (Kaggle)

## Cobertura Validada

| Métrica | Valor |
|----------|----------|
| Primer partido | 1923-01-01 |
| Último partido | 2026-07-05 |
| Total partidos | 1008 |

---

# 🏗️ Arquitectura

```text
Fuentes de Datos
        ↓
Bronze Layer
        ↓
Silver Layer
        ↓
Gold Layer
        ↓
Dashboard Ejecutivo
        ↓
Dashboard Histórico
        ↓
Tableau Public
        ↓
LinkedIn
```

## Capas implementadas

### Bronze

- raw_matches

### Silver

- matches

### Gold

- fact_mexico_matches

---

# 🛠️ Stack Tecnológico

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

## Control de Versiones

- GitHub

## Comunicación

- LinkedIn

---

# 📂 Estructura del Proyecto

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
│   └── 003_silver_matches.ipynb
│
├── dashboards/
│
└── README.md
```

---

# 📊 Dashboards Disponibles

| Dashboard | Estado | Descripción |
|-----------|--------|-------------|
| Dashboard Ejecutivo | ✅ Publicado | Visión general del rendimiento histórico mediante KPIs, resultados, rivales, competiciones y localía. |
| Dashboard Histórico Avanzado | ✅ Publicado | Análisis ofensivo y defensivo mediante goles, evolución histórica, rivales, competiciones y localía. |

---

# 📊 Dashboard Ejecutivo

## KPIs

- Partidos Jugados
- Victorias
- Empates
- Derrotas
- % Victorias

## Visualizaciones

- Rendimiento Histórico por Año
- Resultados por Competición
- Top 10 Rivales Más Enfrentados
- Rendimiento Home / Away / Neutral

---

# ⚽ Dashboard Histórico Avanzado

## KPIs

- Partidos Jugados
- Goles Anotados
- Goles Recibidos
- Promedio de Goles Anotados
- Promedio de Goles Recibidos

## Visualizaciones

- Goles Anotados vs Goles Recibidos por Año
- Top 10 Rivales con Más Goles Anotados
- Top 10 Rivales con Más Goles Recibidos
- Goles Anotados por Competición
- Goles Recibidos por Competición
- Rendimiento Ofensivo y Defensivo por Localía

---

# 🚀 Estado del Proyecto

## Versión

**v1.1.0**

## Estado

✅ MVP COMPLETADO

## Componentes Finalizados

- Infraestructura BigQuery
- Arquitectura Bronze / Silver / Gold
- ETL con Python
- Tabla Gold `fact_mexico_matches`
- Dashboard Ejecutivo
- Dashboard Histórico Avanzado
- Publicaciones en LinkedIn

---

# 🗺️ Roadmap

## ✅ Fase 1 — MVP

- Infraestructura BigQuery
- Arquitectura Bronze / Silver / Gold
- ETL inicial
- Dashboard Ejecutivo

## ✅ Fase 2 — Dashboard Histórico Avanzado

- KPIs ofensivos
- KPIs defensivos
- Evolución de goles
- Rivales por goles
- Goles por competición
- Rendimiento por localía

## ⬜ Fase 3 — Dashboard Rivales

- Historial por selección
- Balance histórico
- Diferencia de goles
- Tendencias por rival

## ⬜ Fase 4 — Dashboard Mundiales

- Participaciones
- Resultados
- Rendimiento por edición
- Eliminatorias

## ⬜ Fase 5 — Nuevas Capas Analíticas

- Ranking FIFA
- Competiciones
- Scouting
- Nuevas tablas Gold

## ⬜ Fase 6 — Automatización

- Integración con APIs
- Pipeline automatizado
- Actualización programada

---

# 👨‍💻 Autor

**Carlos Borja**

Data Analyst | Sports Analytics

LinkedIn

https://www.linkedin.com/in/carlos-borja-analista

GitHub

https://github.com/cabn030399

---

# ⚽ México2030 Analytics

**Transformando datos en historias para entender el camino de la Selección Mexicana rumbo al Mundial 2030.**
