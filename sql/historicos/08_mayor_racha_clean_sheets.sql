/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
06 - Mayor racha de clean sheets consecutivas

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que
México terminó el partido sin recibir goles.

Definición:
Clean Sheet:

    goals_against = 0

Un partido con:

    goals_against > 0

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
-- Obtener los goles recibidos en el partido anterior.
-- ============================================================================

previous_match AS (

    SELECT

        *,

        LAG(goals_against) OVER (
            ORDER BY match_date
        ) AS previous_goals_against

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- streak_groups
--
-- Crear un identificador para cada racha de clean sheets.
--
-- Se inicia un nuevo grupo cuando:
--
-- 1. México recibió un gol en el partido actual.
-- 2. México recibió un gol en el partido anterior.
-- 3. No existe partido anterior.
--
-- Los partidos con goals_against = 0 permanecen dentro de la racha.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN goals_against > 0
                     OR previous_goals_against > 0
                     OR previous_goals_against IS NULL

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
-- clean_sheet_streaks
--
-- Calcular las estadísticas de cada racha de clean sheets.
-- ============================================================================

clean_sheet_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS clean_sheets_consecutivas,

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

    WHERE goals_against = 0

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    clean_sheets_consecutivas,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM clean_sheet_streaks

ORDER BY
    clean_sheets_consecutivas DESC,
    inicio_racha

LIMIT 1;
Fila	inicio_racha	fin_racha	clean_sheets_consecutivas	goles_anotados	goles_recibidos	diferencia_goles	primer_rival	ultimo_rival	torneo_inicio	torneo_final
1	1971-09-30	1971-12-02	7	11.0	0.0	11.0	Greece	Costa Rica	Friendly	CONCACAF Championship
