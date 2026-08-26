/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
05 - Mayor racha recibiendo gol en partidos consecutivos

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que
México recibió al menos un gol.

Definición:
Un partido forma parte de la racha cuando:

    goals_against > 0

Un partido con:

    goals_against = 0

rompe la racha.

Universo:
Todos los partidos disponibles en gold.fact_mexico_matches.

Tabla:
mexico2030analytics.gold.fact_mexico_matches

Versión:
v1.0.0

===============================================================================
*/

WITH ordered_matches AS (

    -- =========================================================================
    -- CTE 1
    -- Obtener todos los partidos ordenados cronológicamente.
    -- =========================================================================

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

),


streak_groups AS (

    -- =========================================================================
    -- CTE 2
    -- Crear un identificador para cada racha recibiendo gol.
    --
    -- Cada partido con goals_against = 0 incrementa el grupo y,
    -- por tanto, rompe la racha.
    -- =========================================================================

    SELECT

        *,

        COUNTIF(goals_against = 0) OVER (
            ORDER BY match_date, match_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS streak_group

    FROM ordered_matches

),


conceding_streaks AS (

    -- =========================================================================
    -- CTE 3
    -- Calcular las estadísticas de cada racha.
    -- =========================================================================

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
            ORDER BY match_date, match_id
            LIMIT 1
        )[OFFSET(0)] AS primer_rival,

        ARRAY_AGG(
            opponent
            ORDER BY match_date DESC, match_id DESC
            LIMIT 1
        )[OFFSET(0)] AS ultimo_rival,

        ARRAY_AGG(
            tournament
            ORDER BY match_date, match_id
            LIMIT 1
        )[OFFSET(0)] AS torneo_inicio,

        ARRAY_AGG(
            tournament
            ORDER BY match_date DESC, match_id DESC
            LIMIT 1
        )[OFFSET(0)] AS torneo_final

    FROM streak_groups

    WHERE goals_against > 0

    GROUP BY streak_group

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
MISMO RESULTADO DE TODO EL DATASET
