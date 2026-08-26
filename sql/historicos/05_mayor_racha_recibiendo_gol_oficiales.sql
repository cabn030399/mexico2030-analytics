/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
05 - Mayor racha recibiendo gol en partidos consecutivos

Universo:
Partidos Oficiales

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que
México recibió al menos un gol en partidos oficiales.

Definición:
Un partido forma parte de la racha cuando:

    goals_against > 0

Un partido con:

    goals_against = 0

rompe la racha.

Metodología Oficiales:
Se incluyen únicamente los torneos clasificados como oficiales
dentro de la metodología de México2030 Analytics.

Torneos incluidos:

    - FIFA World Cup qualification
    - Gold Cup
    - FIFA World Cup
    - Copa América
    - CONCACAF Championship
    - Confederations Cup
    - CONCACAF Nations League
    - CONCACAF Championship qualification
    - Pan American Championship
    - NAFC Championship
    - NAFU Championship

Se excluyen:
    - Friendly
    - USA Cup
    - Central American and Caribbean Games
    - Korea Cup
    - Lunar New Year Cup
    - Kirin Cup
    - Olympic Games
    - Marlboro Cup

Tabla:
mexico2030analytics.gold.fact_mexico_matches

Versión:
v1.0.0

===============================================================================
*/


-- ============================================================================
-- CTE 1
-- ordered_matches
--
-- Seleccionar únicamente partidos pertenecientes al universo oficial.
-- ============================================================================

WITH ordered_matches AS (

    SELECT

        match_id,
        match_date,
        opponent,
        tournament,
        goals_for,
        goals_against,
        goal_difference,
        result

    FROM `mexico2030analytics.gold.fact_mexico_matches`

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

),


-- ============================================================================
-- CTE 2
-- streak_groups
--
-- Crear un identificador para cada racha recibiendo gol.
--
-- Cada partido oficial con goals_against = 0 rompe la racha.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        COUNTIF(goals_against = 0) OVER (

            ORDER BY
                match_date,
                match_id

            ROWS BETWEEN
                UNBOUNDED PRECEDING
                AND CURRENT ROW

        ) AS streak_group

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- conceding_streaks
--
-- Calcular las estadísticas de cada racha.
-- ============================================================================

conceding_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_recibiendo_gol,

        SUM(goals_for) AS goles_anotados,

        SUM(goals_against) AS goles_recibidos,

        SUM(goal_difference) AS diferencia_goles,

        ARRAY_AGG(
            opponent
            ORDER BY
                match_date,
                match_id
            LIMIT 1
        )[OFFSET(0)] AS primer_rival,

        ARRAY_AGG(
            opponent
            ORDER BY
                match_date DESC,
                match_id DESC
            LIMIT 1
        )[OFFSET(0)] AS ultimo_rival,

        ARRAY_AGG(
            tournament
            ORDER BY
                match_date,
                match_id
            LIMIT 1
        )[OFFSET(0)] AS torneo_inicio,

        ARRAY_AGG(
            tournament
            ORDER BY
                match_date DESC,
                match_id DESC
            LIMIT 1
        )[OFFSET(0)] AS torneo_final

    FROM streak_groups

    WHERE goals_against > 0

    GROUP BY
        streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    partidos_recibiendo_gol,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM conceding_streaks

ORDER BY
    partidos_recibiendo_gol DESC,
    inicio_racha ASC

LIMIT 1;
09/10/1977 → 23/11/1980
12 partidos consecutivos recibiendo al menos un gol
30 goles anotados / 22 recibidos / +8
