/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
04 - Mayor racha anotando en partidos consecutivos todo el universo del dataset

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que
México consiguió marcar al menos un gol.

Definición:
Un partido forma parte de la racha cuando:

    goals_for > 0

Un partido con:

    goals_for = 0

rompe la racha.

El resultado del partido (Win, Draw o Loss) no afecta la racha.

Universo:
Todos los partidos disponibles en gold.fact_mexico_matches.

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
-- Obtener los partidos de México ordenados cronológicamente.
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

),


-- ============================================================================
-- CTE 2
-- previous_match
--
-- Obtener la cantidad de goles anotados en el partido anterior.
-- ============================================================================

previous_match AS (

    SELECT

        *,

        LAG(goals_for) OVER (
            ORDER BY match_date
        ) AS previous_goals_for

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- streak_groups
--
-- Crear un identificador para cada racha anotando.
--
-- Se inicia un nuevo grupo cuando:
--
-- 1. México no anotó en el partido actual.
-- 2. México no anotó en el partido anterior.
-- 3. No existe partido anterior.
--
-- Únicamente los partidos con goals_for > 0 permanecen dentro
-- de una racha anotando.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN goals_for = 0
                     OR previous_goals_for = 0
                     OR previous_goals_for IS NULL

                THEN 1

                ELSE 0

            END

        ) OVER (

            ORDER BY match_date

        ) AS streak_group

    FROM previous_match

),


-- ============================================================================
-- CTE 4
-- scoring_streaks
--
-- Calcular las estadísticas de cada racha anotando.
-- ============================================================================

scoring_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_anotando,

        SUM(goals_for) AS goles_anotados,

        SUM(goals_against) AS goles_recibidos,

        SUM(goal_difference) AS diferencia_goles,

        ARRAY_AGG(
            opponent
            ORDER BY match_date
            LIMIT 1
        )[OFFSET(0)] AS primer_rival,

        ARRAY_AGG(
            opponent
            ORDER BY match_date DESC
            LIMIT 1
        )[OFFSET(0)] AS ultimo_rival,

        ARRAY_AGG(
            tournament
            ORDER BY match_date
            LIMIT 1
        )[OFFSET(0)] AS torneo_inicio,

        ARRAY_AGG(
            tournament
            ORDER BY match_date DESC
            LIMIT 1
        )[OFFSET(0)] AS torneo_final

    FROM streak_groups

    WHERE goals_for > 0

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    partidos_anotando,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM scoring_streaks

ORDER BY
    partidos_anotando DESC,
    inicio_racha

LIMIT 1;
Fila	match_date	opponent	tournament	goals_for	goals_against	goal_difference	result
1	1938-01-09	Basque Country	Friendly	3.0	1.0	2.0	Win
2	1938-02-10	Colombia	Central American and Caribbean Games	3.0	1.0	2.0	Win
3	1938-02-14	Venezuela	Central American and Caribbean Games	1.0	0.0	1.0	Win
4	1938-02-18	El Salvador	Central American and Caribbean Games	6.0	0.0	6.0	Win
5	1938-02-20	Panama	Central American and Caribbean Games	2.0	2.0	0.0	Draw
6	1938-02-22	Costa Rica	Central American and Caribbean Games	2.0	1.0	1.0	Win
7	1938-10-16	Basque Country	Friendly	8.0	4.0	4.0	Win
8	1938-10-23	Basque Country	Friendly	2.0	6.0	-4.0	Loss
9	1938-10-30	Basque Country	Friendly	1.0	3.0	-2.0	Loss
10	1947-07-13	United States	NAFC Championship	5.0	0.0	5.0	Win
11	1947-07-17	Cuba	NAFC Championship	3.0	1.0	2.0	Win
12	1949-09-04	United States	NAFC Championship	6.0	0.0	6.0	Win
13	1949-09-11	Cuba	NAFC Championship	2.0	0.0	2.0	Win
14	1949-09-18	United States	FIFA World Cup qualification	6.0	2.0	4.0	Win
15	1949-09-25	Cuba	FIFA World Cup qualification	3.0	0.0	3.0	Win
15 partidos en total marcando.
