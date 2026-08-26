/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
07 - Mayor racha sin anotar
      Selección Mayor A / Clase A

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que México
no consiguió marcar ningún gol dentro del universo de partidos Clase A.

Definición:

Un partido forma parte de la racha cuando:

    goals_for = 0

Un partido con:

    goals_for > 0

rompe la racha.

Metodología:
Se utilizan únicamente partidos correspondientes a la Selección Mayor A /
Clase A.

Los partidos amistosos permanecen incluidos dentro de este universo.

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
-- Obtener únicamente los partidos Clase A y ordenarlos cronológicamente.
--
-- La metodología de Mayor A excluye:
--
--   Central American and Caribbean Games
--   Olympic Games
--
-- Los demás torneos permanecen incluidos, incluyendo Friendly.
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

    WHERE tournament NOT IN (

        'Central American and Caribbean Games',
        'Olympic Games'

    )

),


-- ============================================================================
-- CTE 2
-- streak_groups
--
-- Crear un identificador para cada racha de partidos sin anotar.
--
-- Cada partido donde México anota al menos un gol incrementa el grupo
-- y, por lo tanto, rompe la racha.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        COUNTIF(goals_for > 0) OVER (

            ORDER BY
                match_date,
                match_id

            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW

        ) AS streak_group

    FROM ordered_matches

),


-- ============================================================================
-- CTE 3
-- scoreless_streaks
--
-- Calcular las estadísticas de cada racha de partidos consecutivos
-- sin anotar.
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
    inicio_racha ASC

LIMIT 1;

Métrica	Resultado
Partidos sin anotar	4
Inicio	1975-10-20
Fin	1976-10-10
Goles anotados	0
Goles recibidos	5
Diferencia	-5
Primer rival	Israel
Último rival	Canada

Y los cuatro partidos son:

Israel — 0-1 — Friendly
Brazil — 0-3 — Friendly
United States — 0-0 — Friendly
Canada — 0-1 — CONCACAF Championship qualification
