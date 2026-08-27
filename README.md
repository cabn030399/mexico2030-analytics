# 🇲🇽 México2030 Analytics

## Tricolor Analytics

Proyecto de Sports Analytics enfocado en analizar el rendimiento histórico de la Selección Mexicana de Fútbol mediante técnicas de Data Analytics, Data Engineering y Business Intelligence.

El objetivo es construir una plataforma de análisis que permita estudiar la evolución histórica de México rumbo al Mundial 2030 y generar insights basados en datos para comprender tendencias, fortalezas, oportunidades y récords históricos del equipo nacional.

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

<img width="1366" height="768" alt="Dashboard Ejecutivo" src="https://github.com/user-attachments/assets/03ab2458-f8cd-49a1-baa1-aaa615b97eb9" />

## Dashboard Histórico Avanzado

<img width="1366" height="768" alt="Dashboard Histórico Avanzado" src="https://github.com/user-attachments/assets/a04c6a40-8865-422b-bd32-32c7c6c206ef" />

---

# 🎯 Objetivo del Proyecto

Responder preguntas analíticas como:

- ¿Cómo ha evolucionado el rendimiento histórico de la Selección Mexicana?
- ¿Contra qué rivales obtiene mejores resultados?
- ¿En qué competiciones presenta mejor desempeño?
- ¿Cómo cambia el rendimiento según la localía?
- ¿Cómo ha evolucionado ofensiva y defensivamente a lo largo del tiempo?
- ¿Cuáles son las mayores rachas históricas de México?
- ¿Cómo cambian los récords dependiendo del universo analítico utilizado?
- ¿Qué tendencias pueden identificarse rumbo al Mundial 2030?

---

# 📊 Alcance Actual

## Incluido

- Selección Mexicana Mayor Masculina
- Resultados históricos del dataset utilizado
- Clasificación metodológica de universos analíticos
- Arquitectura Bronze / Silver / Gold
- Procesos ETL con Python
- Data Warehouse en BigQuery
- SQL Analytics Library
- Análisis histórico de récords
- Dashboards interactivos en Tableau Public
- Publicación de análisis en LinkedIn

## Fuera del alcance actual

- Selección Femenil
- Selecciones menores
- APIs deportivas
- Automatización del pipeline
- Machine Learning
- Modelos predictivos
- Datos detallados de jugadores

---

# 📂 Dataset Oficial

## Fuente Principal

**International Football Results from 1872 to 2026**

Autor:

**Mart Jürisoo (Kaggle)**

Archivo principal utilizado:

```text
results.csv
Cobertura Validada
Métrica	Valor
Primer partido	1923-01-01
Último partido	2026-07-05
Total partidos	1008
🏗️ Arquitectura
Fuentes de Datos
        ↓
Bronze Layer
        ↓
Silver Layer
        ↓
Gold Layer
        ↓
SQL Analytics
        ↓
Dashboards
        ↓
Tableau Public
        ↓
LinkedIn
Capas implementadas
Bronze
raw_matches

Datos originales cargados desde la fuente principal.

Silver
matches

Datos limpios y normalizados.

Gold
fact_mexico_matches

Tabla analítica principal del proyecto.

Granularidad:

1 fila = 1 partido de México
🛠️ Stack Tecnológico
Data Engineering
Python
Pandas
Jupyter Notebook
Data Warehouse
Google BigQuery
SQL
BigQuery SQL
Visualización
Tableau Public
Control de Versiones
GitHub
Comunicación
LinkedIn
📂 Estructura del Proyecto
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
📊 Dashboards Disponibles
Dashboard	Estado	Descripción
Dashboard Ejecutivo	✅ Publicado	Visión general del rendimiento histórico mediante KPIs, resultados, rivales, competiciones y localía.
Dashboard Histórico Avanzado	✅ Publicado	Análisis ofensivo y defensivo mediante goles, evolución histórica, rivales, competiciones y localía.
📊 Dashboard Ejecutivo
KPIs
Partidos Jugados
Victorias
Empates
Derrotas
% Victorias
Visualizaciones
Rendimiento Histórico por Año
Resultados por Competición
Top 10 Rivales Más Enfrentados
Rendimiento Home / Away / Neutral
⚽ Dashboard Histórico Avanzado
KPIs
Partidos Jugados
Goles Anotados
Goles Recibidos
Promedio de Goles Anotados
Promedio de Goles Recibidos
Visualizaciones
Goles Anotados vs Goles Recibidos por Año
Top 10 Rivales con Más Goles Anotados
Top 10 Rivales con Más Goles Recibidos
Goles Anotados por Competición
Goles Recibidos por Competición
Rendimiento Ofensivo y Defensivo por Localía
🧠 SQL Analytics Library

Como evolución del proyecto se construyó una biblioteca de consultas analíticas orientada a identificar récords históricos de la Selección Mexicana.

Las consultas utilizan como fuente principal:

gold.fact_mexico_matches

No se crearon nuevas tablas para este análisis.

Universos analíticos

Los récords se calcularon bajo tres universos:

Universo	Descripción
Todo el dataset	Todos los registros históricos disponibles para México en la fuente utilizada.
Mayor A / Clase A	Partidos correspondientes al universo metodológico de la Selección Mayor A / Clase A.
Oficiales	Partidos correspondientes exclusivamente a las competiciones definidas como oficiales dentro de la metodología del proyecto.

Esta separación permite evitar que un mismo récord sea interpretado fuera del contexto metodológico correspondiente.

🏆 Récords Históricos

Se definieron 7 consultas oficiales para monitorear récords históricos bajo los tres universos analíticos.

Consultas
01 — Mayor racha de victorias consecutivas

Identifica la mayor cantidad de partidos consecutivos ganados por México.

02 — Mayor racha de partidos invicto

Identifica la mayor cantidad de partidos consecutivos sin derrota.

03 — Mayor racha de derrotas consecutivas

Identifica la mayor cantidad de partidos consecutivos perdidos.

04 — Mayor racha anotando en partidos consecutivos

Identifica la mayor cantidad de partidos consecutivos en los que México consiguió marcar al menos un gol.

05 — Mayor racha sin perder / récord correspondiente

Consulta histórica definida dentro de la biblioteca analítica según la metodología oficial.

06 — Mayor racha de clean sheets consecutivos

Identifica la mayor cantidad de partidos consecutivos en los que México mantuvo su portería en cero.

07 — Mayor racha de partidos sin anotar

Identifica la mayor cantidad de partidos consecutivos en los que México no consiguió marcar.

📋 Récords Oficiales a Monitorear

Los resultados de las 7 consultas fueron calculados en:

Todo el dataset
Mayor A / Clase A
Oficiales

El proyecto utilizará estos resultados como baseline histórico para futuras actualizaciones del dataset.

Cuando se incorporen nuevos partidos, los récords podrán recalcularse para determinar si existe un nuevo máximo histórico.

Los récords deben interpretarse siempre junto con su universo metodológico.

🔎 Metodología de los Récords

Las consultas utilizan técnicas de SQL analítico sobre:

gold.fact_mexico_matches

Entre las técnicas utilizadas se encuentran:

CTEs
Window Functions
COUNTIF
Agrupaciones por rachas
Ordenamiento cronológico
Identificación de eventos que rompen una racha
Agregaciones de métricas
Validación de resultados históricos

Principio metodológico:

Dato observado
      ↓
Regla analítica
      ↓
Racha identificada
      ↓
Métricas agregadas
      ↓
Récord histórico
📈 Dashboards + Analytics

La evolución del proyecto sigue el flujo:

Datos
  ↓
Modelo
  ↓
Métricas
  ↓
Análisis
  ↓
Visualización
  ↓
Insight
  ↓
Decisión

Los dashboards permiten explorar el rendimiento histórico, mientras que la SQL Analytics Library permite convertir el historial en métricas y récords reproducibles.

🚀 Estado del Proyecto
Versión

v1.2.0

Estado

✅ MVP COMPLETADO
✅ Modelo histórico validado
✅ Dashboards publicados
✅ Analytics Library implementada
✅ Récords históricos establecidos

Componentes Finalizados
Infraestructura BigQuery
Arquitectura Bronze / Silver / Gold
ETL con Python
Tabla Gold fact_mexico_matches
Dashboard Ejecutivo
Dashboard Histórico Avanzado
Auditoría histórica del modelo
SQL Analytics Library
7 consultas de récords históricos
Récords calculados para tres universos analíticos
Publicaciones analíticas en LinkedIn
🗺️ Roadmap
✅ Fase 1 — MVP
Infraestructura BigQuery
Arquitectura Bronze / Silver / Gold
ETL inicial
Dashboard Ejecutivo
✅ Fase 2 — Dashboard Histórico Avanzado
KPIs ofensivos
KPIs defensivos
Evolución de goles
Rivales por goles
Goles por competición
Rendimiento por localía
✅ Fase 3 — Analytics Histórica
SQL Analytics Library
Análisis de rachas
Récords históricos
Comparación Todo el Dataset / Mayor A / Oficiales
Definición de baseline histórico
⬜ Fase 4 — Dashboard Rivales
Historial por selección
Balance histórico
Diferencia de goles
Tendencias por rival
⬜ Fase 5 — Dashboard Mundiales
Participaciones
Resultados
Rendimiento por edición
Eliminatorias
⬜ Fase 6 — Nuevas Capas Analíticas
Ranking FIFA
Competiciones
Scouting
Nuevas tablas Gold
⬜ Fase 7 — Automatización
Integración con APIs
Pipeline automatizado
Actualización programada
Monitoreo de récords históricos
📐 Principios del Proyecto
Mantener una única fuente de verdad.
Priorizar valor analítico sobre complejidad técnica.
Mantener una arquitectura simple y mantenible.
Validar los resultados antes de publicarlos.
Separar claramente dato, cálculo e interpretación.
Utilizar definiciones metodológicas consistentes.
Evitar filtros ambiguos sobre competiciones.
Documentar decisiones importantes.
Construir visualizaciones con una función analítica clara.
Priorizar evidencia profesional sobre cantidad de funcionalidades.
👨‍💻 Autor

Carlos Borja

Data Analyst | Sports Analytics

LinkedIn

https://www.linkedin.com/in/carlos-borja-analista

GitHub

https://github.com/cabn030399

⚽ México2030 Analytics

Transformando datos en historias para entender el camino de la Selección Mexicana rumbo al Mundial 2030.
