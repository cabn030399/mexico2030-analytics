/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
03 - Mayor racha de partidos sin ganar

Objetivo:
Identificar la mayor racha de partidos consecutivos en los que
México NO consiguió una victoria.

Definición:
Un partido "sin ganar" corresponde a:

    Draw = Empate
    Loss = Derrota

Una victoria (Win) rompe la racha.

Ejemplo:

    Loss → Draw → Loss → Draw → Loss

    = 5 partidos sin ganar

Universo:
Todos los partidos disponibles en
gold.fact_mexico_matches.

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
-- Obtener todos los partidos de México ordenados cronológicamente.
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
-- Obtener el resultado del partido anterior.
-- ============================================================================

previous_match AS (

    SELECT

        *,

        LAG(result) OVER (
            ORDER BY match_date
        ) AS previous_result

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- streak_groups
--
-- Crear grupos para cada racha de partidos sin ganar.
--
-- Se inicia un nuevo grupo cuando:
--
-- 1. El partido actual es una victoria.
-- 2. El partido anterior fue una victoria.
-- 3. No existe partido anterior.
--
-- Los resultados Draw y Loss permanecen dentro de la misma racha.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN result = 'Win'
                     OR previous_result = 'Win'
                     OR previous_result IS NULL

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
-- winless_streaks
--
-- Calcular las estadísticas de cada racha sin ganar.
--
-- Se excluyen las victorias porque una victoria rompe la racha.
-- ============================================================================

winless_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_sin_ganar,

        COUNTIF(result = 'Draw') AS empates,

        COUNTIF(result = 'Loss') AS derrotas,

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

    WHERE result IN ('Draw', 'Loss')

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
--
-- Ordenar las rachas de mayor a menor duración.
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    partidos_sin_ganar,

    empates,

    derrotas,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM winless_streaks

ORDER BY
    partidos_sin_ganar DESC,
    inicio_racha

LIMIT 1;
🏆 Resultado validado

Mayor racha histórica de partidos sin ganar: 10

📅 14/06/1970 → 25/09/1971

10 partidos sin ganar
4 empates
6 derrotas
⚽ 4 goles anotados
🥅 20 goles recibidos
📉 Diferencia: -16
Primer rival: Italy
Último rival: Italy

La secuencia fue:

Loss
Loss
Draw
Draw
Draw
Loss
Loss
Draw
Loss
Loss
