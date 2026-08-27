Data Dictionary
🇲🇽 México2030 Analytics

Última actualización: Agosto 2026

Objetivo

Documentar las tablas, columnas y definiciones utilizadas en México2030 Analytics.

Este documento describe la estructura de datos utilizada por las capas Bronze, Silver y Gold, así como la granularidad y las convenciones principales del modelo analítico.

DATASET: BRONZE
Tabla: raw_matches

Fuente:

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo

Archivo origen:

results.csv

Columna	Tipo	Descripción
date	DATE	Fecha del partido
home_team	STRING	Equipo local
away_team	STRING	Equipo visitante
home_score	INTEGER	Goles del equipo local
away_score	INTEGER	Goles del equipo visitante
tournament	STRING	Competición
city	STRING	Ciudad
country	STRING	País
neutral	BOOLEAN	Indica si el partido fue disputado en sede neutral

Estado:

✅ Implementada

Tabla: raw_goalscorers

Fuente:

goalscorers.csv

Estado:

🔄 Planeada

Tabla: raw_shootouts

Fuente:

shootouts.csv

Estado:

🔄 Planeada

Tabla: raw_former_names

Fuente:

former_names.csv

Estado:

🔄 Planeada

DATASET: SILVER
Tabla: matches

Descripción:

Datos históricos limpios y normalizados provenientes de raw_matches.

La tabla constituye la capa intermedia entre los datos originales y la tabla analítica Gold.

Estado:

✅ Implementada

Resultados de calidad
49,501 registros válidos
0 duplicados
0 valores nulos en los campos críticos validados
Columnas principales
Columna	Descripción
match_id	Identificador único del partido
date	Fecha del partido
home_team	Equipo local
away_team	Equipo visitante
home_score	Goles del equipo local
away_score	Goles del equipo visitante
tournament	Competición
city	Ciudad
country	País
neutral	Indica si el partido fue disputado en sede neutral
DATASET: GOLD
Tabla: fact_mexico_matches

Descripción:

Tabla analítica principal de México2030 Analytics.

Contiene los partidos correspondientes a la Selección Mexicana identificados a partir de la capa Silver y transformados a una estructura orientada al análisis histórico.

Granularidad:

1 fila = 1 partido de México

Estado:

✅ Implementada

Cobertura
Primer partido: 1923-01-01
Último partido: 2026-07-05
Total partidos: 1008
Columnas
Columna	Descripción
match_id	Identificador único del partido
match_date	Fecha del encuentro
year	Año del encuentro
opponent	Rival de México
tournament	Competición
venue_type	Condición de sede: Home / Away / Neutral
goals_for	Goles anotados por México
goals_against	Goles recibidos por México
goal_difference	Diferencia entre goles anotados y recibidos
result	Resultado del partido: Win / Draw / Loss
Universos Analíticos

La tabla gold.fact_mexico_matches funciona como fuente común para diferentes universos analíticos.

La pertenencia a cada universo se determina mediante reglas de análisis y filtros sobre los datos existentes.

1. Todo el dataset

Incluye todos los partidos disponibles de México en la tabla Gold.

No aplica filtros adicionales de clasificación competitiva.

2. Mayor A / Clase A

Representa el universo de partidos de la Selección Mayor A / Clase A definido por la metodología del proyecto.

La clasificación se realiza mediante los criterios establecidos en las consultas analíticas y no mediante una columna física adicional en fact_mexico_matches.

Los amistosos permanecen incluidos dentro de este universo cuando corresponden a partidos Clase A.

3. Oficiales

Incluye únicamente las competiciones clasificadas como oficiales dentro de la metodología de México2030 Analytics.

La selección se realiza mediante coincidencia exacta sobre el campo tournament.

Ejemplo:

WHERE tournament IN (
    'FIFA World Cup qualification',
    'Gold Cup',
    'FIFA World Cup',
    'Copa América',
    'CONCACAF Championship',
    'Confederations Cup',
    'CONCACAF Nations League',
    'CONCACAF Championship qualification',
    'Pan American Championship',
    'NAFC Championship',
    'NAFU Championship'
)

Los partidos amistosos quedan excluidos de este universo.

Convenciones
Venue Type
Valor	Descripción
Home	México juega como local
Away	México juega como visitante
Neutral	Partido disputado en sede neutral
Result
Valor	Descripción
Win	Victoria de México
Draw	Empate
Loss	Derrota de México
Convención de Competición

Para los análisis por torneo se utilizan los valores exactos almacenados en el campo tournament.

Criterio recomendado:

WHERE tournament = 'FIFA World Cup'

Se evita utilizar búsquedas amplias como:

WHERE tournament LIKE '%World Cup%'

cuando el objetivo es analizar una competición específica, debido a que pueden mezclarse competiciones diferentes como:

FIFA World Cup
FIFA World Cup qualification
Tablas Futuras
fact_fifa_ranking

Estado:

🔄 Planeada

Descripción:

Histórico del ranking FIFA para análisis temporal y contextual del rendimiento de México.

fact_players_pool

Estado:

🔄 Planeada

Descripción:

Información histórica relacionada con jugadores convocados y participación de futbolistas.

Regla de Gobierno

Toda nueva tabla aprobada deberá documentarse en este archivo antes de ser utilizada en dashboards o análisis.

Las nuevas métricas derivadas de fact_mexico_matches no requieren una nueva tabla cuando puedan calcularse correctamente mediante SQL sobre la estructura Gold existente.

Esto permite mantener una arquitectura simple:

Bronze
   ↓
Silver
   ↓
Gold
   ↓
Analytics / Dashboards
Nota sobre las consultas analíticas

Las consultas históricas de récords 01–07 utilizan gold.fact_mexico_matches como fuente común.

No requieren modificaciones estructurales de la tabla Gold porque las métricas se obtienen mediante transformaciones SQL sobre las columnas existentes.

Los resultados se documentan en la documentación específica de Analytics / Récords Históricos, no en este Data Dictionary.

Estado del documento:

✅ Actualizado y alineado con la arquitectura y metodología actual del proyecto.
