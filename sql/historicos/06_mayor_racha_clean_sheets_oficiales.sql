/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
06 - Mayor racha de clean sheets consecutivos

Objetivo:
Identificar la mayor cantidad de partidos oficiales consecutivos en los que
México consiguió mantener su portería en cero.

Definición:
Un partido forma parte de la racha cuando:

    goals_against = 0

Un partido con:

    goals_against > 0

rompe la racha.

Metodología Oficiales:
Se incluyen únicamente los torneos clasificados como oficiales dentro de
la metodología de México2030 Analytics.

Torneos oficiales incluidos:

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
    - Central American and Caribbean Games
    - Olympic Games
    - USA Cup
    - Korea Cup
    - Lunar New Year Cup
    - Kirin Cup
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
-- Seleccionar únicamente los partidos oficiales y ordenarlos
-- cronológicamente.
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
-- Crear un identificador para cada racha de clean sheets.
--
-- Cada partido donde México recibe al menos un gol rompe la racha.
--
-- COUNTIF(goals_against > 0) aumenta el grupo cada vez que ocurre
-- un partido que rompe la clean sheet.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        COUNTIF(goals_against > 0) OVER (

            ORDER BY match_date, match_id

            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW

        ) AS streak_group

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- clean_sheet_streaks
--
-- Calcular las estadísticas de cada racha de partidos consecutivos
-- sin recibir goles.
-- ============================================================================

clean_sheet_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_clean_sheet,

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

    WHERE goals_against = 0

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    partidos_clean_sheet,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM clean_sheet_streaks

ORDER BY

    partidos_clean_sheet DESC,
    inicio_racha ASC

LIMIT 1;
. El resultado de **Consulta 06 — Oficiales** es:

| Métrica                               |                    Resultado |
| ------------------------------------- | ---------------------------: |
| Inicio                                |                   13/07/2003 |
| Fin                                   |                   27/06/2004 |
| Partidos consecutivos sin recibir gol |                        **7** |
| Goles anotados                        |                           27 |
| Goles recibidos                       |                        **0** |
| Diferencia                            |                      **+27** |
| Primer rival                          |                       Brazil |
| Último rival                          |                     Dominica |
| Torneo inicial                        |                     Gold Cup |
| Torneo final                          | FIFA World Cup qualification |

