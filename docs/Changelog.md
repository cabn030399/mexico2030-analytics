Changelog
🇲🇽 México2030 Analytics

Registro oficial de cambios del proyecto.

v1.2.0 — Analytics de Récords Históricos

Fecha: Agosto 2026

Añadido
SQL Analytics Library — Récords Históricos

Se construyó una biblioteca de consultas SQL para identificar los principales récords históricos de la Selección Mexicana.

Las consultas utilizan como fuente principal:

gold.fact_mexico_matches

Se definieron siete métricas históricas:

Mayor racha de victorias
Mayor racha de derrotas
Mayor racha sin ganar
Mayor racha anotando
Mayor racha recibiendo gol
Mayor racha de clean sheets
Mayor racha sin anotar
Universos de análisis

Cada récord se analiza bajo tres universos metodológicos:

1. Todo el dataset

Incluye todos los partidos disponibles en gold.fact_mexico_matches.

Este universo representa el récord histórico completo del dataset.

2. Selección Mayor A / Clase A

Incluye los partidos correspondientes a la Selección Mayor A / Clase A según la metodología definida para México2030 Analytics.

Los partidos amistosos permanecen incluidos dentro de este universo cuando corresponden a partidos Clase A.

Se excluyen competiciones identificadas como no pertenecientes a la Selección Mayor A, entre ellas:

Central American and Caribbean Games
Olympic Games
3. Partidos Oficiales

Incluye únicamente los torneos clasificados como oficiales dentro de la metodología del proyecto.

Se excluyen los partidos amistosos y las competiciones clasificadas como no oficiales.

Torneos incluidos actualmente:

FIFA World Cup qualification
Gold Cup
FIFA World Cup
Copa América
CONCACAF Championship
Confederations Cup
CONCACAF Nations League
CONCACAF Championship qualification
Pan American Championship
NAFC Championship
NAFU Championship

La clasificación de oficiales es una decisión metodológica del proyecto y deberá mantenerse consistente entre consultas, documentación y futuros análisis.

Récords Históricos Oficiales
Consulta 01 — Mayor racha de victorias
Universo	Récord
Todo el dataset	13
Mayor A / Clase A	11
Oficiales	9
Consulta 02 — Mayor racha de derrotas
Universo	Récord
Todo el dataset	6
Mayor A / Clase A	6
Oficiales	6
Consulta 03 — Mayor racha sin ganar
Universo	Récord
Todo el dataset	10
Mayor A / Clase A	10
Oficiales	9
Consulta 04 — Mayor racha anotando
Universo	Récord
Todo el dataset	15
Mayor A / Clase A	15
Oficiales	17
Observación metodológica

El récord de 17 partidos oficiales consecutivos anotando corresponde a una secuencia que incluye los partidos de clasificación y Gold Cup de 2009 y continúa durante la Copa Mundial de 2010.

En el universo Mayor A / Clase A la racha es de 15 partidos, debido a que dos partidos amistosos con goals_for = 0 interrumpen la secuencia cronológica.

Esto demuestra que los tres universos no deben interpretarse como simples filtros equivalentes: cada uno responde a una definición histórica diferente.

Consulta 05 — Mayor racha recibiendo gol
Universo	Récord
Todo el dataset	13
Mayor A / Clase A	13
Oficiales	12
Consulta 06 — Mayor racha de clean sheets
Universo	Récord
Todo el dataset	7
Mayor A / Clase A	7
Oficiales	7
Consulta 07 — Mayor racha sin anotar
Universo	Récord
Todo el dataset	4
Mayor A / Clase A	4
Oficiales	3
Metodología de validación

Los récords no se aceptan únicamente por el resultado agregado de la consulta.

Para cada récord se realiza una auditoría de los partidos que conforman la racha.

Proceso:

Consulta general
      ↓
Identificación de la racha
      ↓
Listado de partidos
      ↓
Revisión de rivales
      ↓
Revisión de torneo
      ↓
Clasificación Mayor A / Clase A
      ↓
Clasificación Oficial
      ↓
Validación del récord

Esto permite determinar si una racha encontrada en el dataset completo debe mantenerse o excluirse al pasar a los universos Mayor A u Oficiales.

Decisiones metodológicas
Los récords se construyen desde el dataset hacia los universos específicos

La metodología utilizada es:

Todo el dataset → Auditoría → Mayor A / Clase A → Auditoría → Oficiales

No se asume que un récord del dataset completo sea automáticamente un récord de la Selección Mayor A ni un récord oficial.

Auditoría partido por partido

Cuando una racha representa un posible récord histórico, se revisan los partidos individuales que la componen.

Esto permite detectar:

partidos de categorías no correspondientes a Mayor A
amistosos
competiciones no oficiales
interrupciones provocadas por un 0-0
diferencias entre los tres universos
Orden cronológico

Las rachas se calculan respetando:

match_date
match_id

El uso de match_id como criterio secundario permite resolver posibles partidos registrados en la misma fecha sin alterar el orden cronológico del dataset.

Resultado

Se completaron las siete consultas históricas para los tres universos metodológicos.

Estado:

✅ Analytics de récords históricos completado

Los récords quedan establecidos como métricas históricas de referencia para futuras actualizaciones del proyecto.

v1.1.0 — Dashboard Histórico Avanzado

Fecha: Julio 2026

Añadido
Nuevo Dashboard Histórico Avanzado

Construcción del segundo dashboard especializado utilizando exclusivamente la tabla:

gold.fact_mexico_matches

KPIs
Partidos Jugados
Goles Anotados
Goles Recibidos
Promedio de Goles Anotados
Promedio de Goles Recibidos
Visualizaciones
Evolución de Goles Anotados vs Goles Recibidos por Año
Top 10 Rivales con Más Goles Anotados
Top 10 Rivales con Más Goles Recibidos
Goles Anotados por Competición
Goles Recibidos por Competición
Rendimiento Ofensivo y Defensivo por Localía
Decisiones Arquitectónicas
Se mantuvo una única fuente de datos (gold.fact_mexico_matches).
No se incorporaron nuevas tablas ni nuevas fuentes.
Se reutilizó la identidad visual del Dashboard Ejecutivo para mantener consistencia.
El análisis geográfico quedó pospuesto para futuras versiones al requerir nuevas dimensiones de datos.
Resultado

✅ Dashboard publicado en Tableau Public.

v1.0.0 — MVP Completado

Fecha: Julio 2026

Añadido
Arquitectura
BigQuery Bronze
BigQuery Silver
BigQuery Gold
Data Engineering
ETL desarrollado con Python
Construcción de gold.fact_mexico_matches
Dashboard Ejecutivo
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
Resultado

Cobertura validada:

Primer partido: 1923-01-01
Último partido: 2026-07-05
Total partidos: 1008

Estado:

✅ MVP COMPLETADO

v0.4.0 — Gold Layer

Fecha: Julio 2026

Añadido
Creación de gold.fact_mexico_matches
Definición oficial de la granularidad:
1 fila = 1 partido de México
Construcción de métricas analíticas para Tableau

Estado:

✅ Completado

v0.3.0 — Silver Layer

Fecha: Julio 2026

Añadido
Eliminación de registros sin marcador
Validación de duplicados
Creación de match_id
Construcción de silver.matches

Resultado:

49,501 registros válidos para análisis.

Estado:

✅ Completado

v0.2.0 — Data Ingestion

Fecha: Julio 2026

Añadido
Notebook 001_data_ingestion.ipynb
Exploración inicial del dataset
Validación de calidad
Primera carga hacia BigQuery

Hallazgos:

49,505 registros históricos
1,008 partidos correspondientes a México

Estado:

✅ Completado

v0.1.0 — Fundación del Proyecto

Fecha: Julio 2026

Añadido
Definición de visión
Objetivos estratégicos
Alcance del proyecto
Selección del stack tecnológico
Creación del repositorio GitHub
Creación de la documentación inicial
Definición de la arquitectura Bronze / Silver / Gold
Selección del dataset oficial
Dataset Oficial

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo (Kaggle)

Archivos:

results.csv
goalscorers.csv
shootouts.csv
former_names.csv

Estado:

✅ Proyecto iniciado

Auditorías de Calidad

Durante la construcción del Dashboard Ejecutivo se realizaron auditorías completas para validar la consistencia de las métricas por competición.

Competiciones auditadas
Gold Cup
FIFA World Cup
FIFA World Cup Qualification
Copa América
CONCACAF Nations League
Friendly
Validaciones realizadas
Partidos jugados
Victorias
Empates
Derrotas
Porcentaje de victorias
Distribución por localía
Top rivales históricos
Consistencia entre SQL, BigQuery y Tableau
Decisión aprobada

Como estándar oficial del proyecto se utilizarán filtros exactos sobre el campo tournament.

Ejemplo:

WHERE tournament = 'FIFA World Cup'

Evitando expresiones como:

LIKE '%World Cup%'

para impedir mezclar competiciones con nombres similares.

Resultado:

✅ Todas las auditorías fueron aprobadas satisfactoriamente.

