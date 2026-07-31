/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Categoría:
Históricos

Consulta:
02 - Mayor racha de victorias consecutivas (Competiciones Oficiales)

Objetivo:
Identificar la mayor racha de victorias consecutivas de la
Selección Mexicana considerando únicamente competiciones oficiales
definidas por la metodología del proyecto.

Competiciones incluidas:

✓ FIFA World Cup
✓ FIFA World Cup qualification
✓ Gold Cup
✓ CONCACAF Championship
✓ CONCACAF Championship qualification
✓ Copa América
✓ Confederations Cup
✓ CONCACAF Nations League

Competiciones excluidas:

✗ Friendly
✗ Olympic Games
✗ Kirin Cup
✗ Korea Cup
✗ Marlboro Cup
✗ NAFU Championship
✗ NAFC Championship
✗ Lunar New Year Cup
✗ Pan American Championship
✗ Central American and Caribbean Games

Tabla principal:
gold.fact_mexico_matches

Versión:
v1.0.0

===============================================================================
*/

-- ============================================================================
-- CTE 1
-- ordered_matches
--
-- Filtrar únicamente las competiciones oficiales.
-- ============================================================================

WITH ordered_matches AS (

SELECT

    match_date,
    opponent,
    tournament,
    goals_for,
    goals_against,
    goal_difference,
    result

FROM `mexico2030analytics.gold.fact_mexico_matches`

WHERE tournament IN (

'FIFA World Cup',

'FIFA World Cup qualification',

'Gold Cup',

'CONCACAF Championship',

'CONCACAF Championship qualification',

'Copa América',

'Confederations Cup',

'CONCACAF Nations League'

)

),

-- ============================================================================
-- CTE 2
-- previous_match
--
-- Obtener el resultado del partido anterior.
-- ============================================================================

previous_match AS (

SELECT

    *,

    LAG(result) OVER(
        ORDER BY match_date
    ) AS previous_result

FROM ordered_matches

),

-- ============================================================================
-- CTE 3
-- streak_groups
--
-- Crear identificadores únicos para cada racha de victorias.
-- ============================================================================

streak_groups AS (

SELECT

    *,

    SUM(

        CASE

            WHEN result <> 'Win'
                 OR previous_result <> 'Win'
                 OR previous_result IS NULL

            THEN 1

            ELSE 0

        END

    ) OVER(

        ORDER BY match_date

    ) AS streak_group

FROM previous_match

),

-- ============================================================================
-- CTE 4
-- win_streaks
--
-- Calcular estadísticas de cada racha.
-- ============================================================================

win_streaks AS (

SELECT

    streak_group,

    MIN(match_date) AS inicio_racha,

    MAX(match_date) AS fin_racha,

    COUNT(*) AS victorias_consecutivas,

    SUM(goals_for) AS goles_anotados,

    SUM(goals_against) AS goles_recibidos,

    SUM(goal_difference) AS diferencia_goles,

    ARRAY_AGG(opponent ORDER BY match_date LIMIT 1)[OFFSET(0)] AS primer_rival,

    ARRAY_AGG(opponent ORDER BY match_date DESC LIMIT 1)[OFFSET(0)] AS ultimo_rival,

    ARRAY_AGG(tournament ORDER BY match_date LIMIT 1)[OFFSET(0)] AS torneo_inicio,

    ARRAY_AGG(tournament ORDER BY match_date DESC LIMIT 1)[OFFSET(0)] AS torneo_final

FROM streak_groups

WHERE result = 'Win'

GROUP BY streak_group

)

-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    victorias_consecutivas,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM win_streaks

ORDER BY
    victorias_consecutivas DESC,
    inicio_racha

LIMIT 1;
===============================================================================
DESCRIPCIÓN DEL ALGORITMO
===============================================================================

CTE 1 - ordered_matches
-----------------------
Selecciona únicamente partidos correspondientes a competiciones
oficiales según la metodología de México2030 Analytics.

CTE 2 - previous_match
----------------------
Obtiene el resultado del partido inmediatamente anterior utilizando
la función LAG().

CTE 3 - streak_groups
---------------------
Identifica automáticamente el inicio de una nueva racha mediante
una suma acumulada sobre los cambios de resultado.

CTE 4 - win_streaks
-------------------
Calcula:

• Fecha de inicio.
• Fecha de fin.
• Victorias consecutivas.
• Goles anotados.
• Goles recibidos.
• Diferencia de goles.
• Primer rival.
• Último rival.
• Torneo inicial.
• Torneo final.

Resultado final
---------------
Ordena todas las rachas por número de victorias consecutivas y
devuelve únicamente la mayor racha en competiciones oficiales.

===============================================================================
