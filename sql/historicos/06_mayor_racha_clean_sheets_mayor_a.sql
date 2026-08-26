/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
06 - Mayor racha de clean sheets consecutivos
    Selección Mayor A / Clase A

Objetivo:
Identificar la mayor cantidad de partidos consecutivos en los que México
mantuvo su portería en cero dentro del universo de partidos Clase A.

Definición:

Un partido forma parte de la racha cuando:

    goals_against = 0

Un partido con:

    goals_against > 0

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
-- NOTA:
-- La identificación de Clase A se realiza mediante la metodología definida
-- previamente para México2030 Analytics.
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

    WHERE

        -- Excluir torneos que no corresponden al universo Mayor A

        tournament NOT IN (

            'Central American and Caribbean Games',
            'Olympic Games'

        )

),


-- ============================================================================
-- CTE 2
-- streak_groups
--
-- Crear un identificador para cada racha de clean sheets.
--
-- Cada partido donde México recibe al menos un gol incrementa el grupo.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        COUNTIF(goals_against > 0) OVER (

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
-- clean_sheet_streaks
--
-- Calcular las estadísticas de cada racha de partidos consecutivos
-- sin recibir gol.
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
resultado de 06 — Mayor A:

Métrica	Resultado
Inicio	30/09/1971
Fin	02/12/1971
Partidos clean sheet	7
Goles anotados	11
Goles recibidos	0
Diferencia	+11
Primer rival	Greece
Último rival	Costa Rica
Torneo inicial	Friendly
Torneo final	CONCACAF Championship
1	1	8575	1971-09-30	Greece	Friendly	1.0	0.0	1.0	Win
2	2	8581	1971-10-06	Bermuda	CONCACAF Championship qualification	2.0	0.0	2.0	Win
3	3	8582	1971-10-13	Bermuda	CONCACAF Championship qualification	4.0	0.0	4.0	Win
4	4	8647	1971-11-21	Haiti	CONCACAF Championship	0.0	0.0	0.0	Draw
5	5	8655	1971-11-26	Trinidad and Tobago	CONCACAF Championship	2.0	0.0	2.0	Win
6	6	8659	1971-11-28	Cuba	CONCACAF Championship	1.0	0.0	1.0	Win
7	7	8671	1971-12-02	Costa Rica	CONCACAF Championship	1.0	0.0	1.0	Win
