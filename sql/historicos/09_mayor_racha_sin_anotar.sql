/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
07 - Mayor racha sin anotar

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que
México no consiguió marcar ningún gol.

Definición:
Un partido forma parte de la racha cuando:

    goals_for = 0

Un partido con:

    goals_for > 0

rompe la racha.

El resultado del partido (Win, Draw o Loss) no afecta la condición.

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
-- Obtener los goles anotados en el partido anterior.
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
-- Crear un identificador para cada racha sin anotar.
--
-- Se inicia un nuevo grupo cuando:
--
-- 1. México anotó en el partido actual.
-- 2. México anotó en el partido anterior.
-- 3. No existe partido anterior.
--
-- Los partidos con goals_for = 0 permanecen dentro de la misma racha.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN goals_for > 0
                     OR previous_goals_for > 0
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
-- scoreless_streaks
--
-- Calcular las estadísticas de cada racha sin anotar.
-- ============================================================================

scoreless_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_sin_anotar,

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

    WHERE goals_for = 0

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    partidos_sin_anotar,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM scoreless_streaks

ORDER BY
    partidos_sin_anotar DESC,
    inicio_racha

LIMIT 1;

| Métrica                 |                           Resultado |
| ----------------------- | ----------------------------------: |
| **Partidos sin anotar** |                               **4** |
| Inicio                  |                          20/10/1975 |
| Fin                     |                          10/10/1976 |
| Goles anotados          |                                   0 |
| Goles recibidos         |                                   5 |
| Diferencia              |                                  -5 |
| Primer rival            |                              Israel |
| Último rival            |                              Canada |
| Torneo inicial          |                            Friendly |
| Torneo final            | CONCACAF Championship qualification |

20/10/1975  Israel          0-1
04/06/1976  Brazil          0-3
03/10/1976  United States   0-0
10/10/1976  Canada          0-1
