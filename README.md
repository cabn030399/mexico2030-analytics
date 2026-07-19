# 🇲🇽 México2030 Analytics

## Tricolor Analytics

Proyecto de Sports Analytics enfocado en analizar el rendimiento histórico de la Selección Mexicana de Fútbol mediante técnicas de Data Analytics, Data Engineering y Business Intelligence.

El objetivo es construir una plataforma de análisis que permita estudiar la evolución de México rumbo al Mundial 2030 y generar insights basados en datos para comprender tendencias, fortalezas y oportunidades de mejora del equipo nacional.

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

Responder preguntas como:

- ¿Cómo ha evolucionado el rendimiento de México a lo largo de su historia?
- ¿Contra qué rivales obtiene mejores resultados?
- ¿Cómo cambia el desempeño según el torneo?
- ¿Qué impacto tiene jugar como local, visitante o en sede neutral?
- ¿Qué tendencias pueden identificarse rumbo al Mundial 2030?

---

## 📊 Alcance Actual (MVP)

### Incluido

- Selección Mexicana Mayor Masculina
- Resultados históricos oficiales
- Dashboard interactivo en Tableau Public
- Publicación de análisis en LinkedIn
- Arquitectura Bronze / Silver / Gold
- Procesos ETL con Python
- Data Warehouse en BigQuery

### Fuera del alcance actual

- Selección Femenil
- Selección Sub-23
- Selección Sub-20
- Datos de jugadores
- Modelos predictivos
- Machine Learning

---

## 📂 Dataset Oficial

### Fuente principal

International Football Results from 1872 to 2026

Autor:
Mart Jürisoo (Kaggle)

### Cobertura validada para México

| Métrica | Valor |
|----------|----------|
| Primer partido | 1923-01-01 |
| Último partido | 2026-07-05 |
| Total partidos | 1008 |

---

## 🏗️ Arquitectura

```text
Fuentes de Datos
        ↓
Bronze Layer
        ↓
Silver Layer
        ↓
Gold Layer
        ↓
Tableau Public
        ↓
LinkedIn
```

### Capas implementadas

#### Bronze

- raw_matches

#### Silver

- matches

#### Gold

- fact_mexico_matches

---

## 🛠️ Stack Tecnológico

### Data Engineering

- Python
- Pandas
- Jupyter Notebook

### Data Warehouse

- Google BigQuery

### SQL

- BigQuery SQL

### Visualización

- Tableau Public

### Control de Versiones

- GitHub

### Comunicación

- LinkedIn

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
│   └── 003_silver_matches.ipynb
│
├── dashboard/
│
└── README.md
```

---

## 📈 Dashboard V1

### KPIs

- Partidos Jugados
- Victorias
- Empates
- Derrotas
- % Victorias

### Visualizaciones

- Rendimiento Histórico por Año
- Resultados por Competición
- Rendimiento Home / Away / Neutral
- Top 10 Rivales Más Enfrentados

---

## 🚀 Estado del Proyecto

### Versión actual

v0.1.0

### Estado

✅ MVP COMPLETADO

### Componentes finalizados

- Infraestructura BigQuery
- Bronze Layer
- Silver Layer
- Gold Layer
- fact_mexico_matches
- Dashboard Tableau V1
- Publicación inicial en LinkedIn

---
## Roadmap

✅ MVP Dashboard V1

🔄 Dashboard V1.1

⬜ Métricas avanzadas

⬜ Automatización

⬜ Dashboard Mundial 2030

## 🗺️ Roadmap

### ✅ Fase 1 — MVP

- Infraestructura en BigQuery
- Arquitectura Bronze / Silver / Gold
- ETL inicial
- Dashboard Tableau V1
- Publicación inicial

### 🔄 Fase 2 — Dashboard V1.1

- Mejora visual del dashboard
- Filtros globales
- Optimización de storytelling
- Mejor experiencia de usuario

### ⬜ Fase 3 — Analytics Avanzado

- Métricas por década
- Análisis por rival
- Rendimiento por torneo
- Nuevas tablas Gold

### ⬜ Fase 4 — Automatización

- Integración con APIs
- Actualización automática de datos
- Pipeline automatizado

### ⬜ Fase 5 — México rumbo al Mundial 2030

- Seguimiento continuo de resultados
- Publicaciones post-partido
- Dashboard actualizado periódicamente

---

## 👨‍💻 Autor

Carlos Borja

Data Analyst | Sports Analytics

LinkedIn:
https://www.linkedin.com/in/carlos-borja-analista

GitHub:
https://github.com/cabn030399

---

## ⚽ México2030 Analytics

Transformando datos en historias para entender el camino de la Selección Mexicana rumbo al Mundial 2030.
