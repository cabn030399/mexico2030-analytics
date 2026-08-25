-- ============================================================
-- CONSULTA 03
-- Mayor racha de partidos sin ganar
-- Partidos Oficiales
-- México2030 Analytics
-- ============================================================


WITH official_matches AS (

    -- ========================================================
    -- CTE 1: Partidos oficiales
    -- ========================================================

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


previous_match AS (

    -- ========================================================
    -- CTE 2: Resultado del partido oficial anterior
    -- ========================================================

    SELECT
        match_id,
        match_date,
        opponent,
        tournament,
        goals_for,
        goals_against,
        goal_difference,
        result,

        LAG(result) OVER (
            ORDER BY match_date, match_id
        ) AS previous_result

    FROM official_matches

),


streak_groups AS (

    -- ========================================================
    -- CTE 3: Identificación de grupos de racha
    -- ========================================================

    SELECT
        match_id,
        match_date,
        opponent,
        tournament,
        goals_for,
        goals_against,
        goal_difference,
        result,
        previous_result,

        SUM(
            CASE
                WHEN result = 'Win'
                     OR previous_result = 'Win'
                     OR previous_result IS NULL
                THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY match_date, match_id
        ) AS streak_group

    FROM previous_match

),


winless_streaks AS (

    -- ========================================================
    -- CTE 4: Agrupación de partidos sin ganar
    -- ========================================================

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_sin_ganar,

        COUNTIF(result = 'Draw') AS empates,

        COUNTIF(result = 'Loss') AS derrotas,

        SUM(goals_for) AS goles_anotados,

        SUM(goals_against) AS goles_recibidos,

        SUM(goal_difference) AS diferencia_goles

    FROM streak_groups

    WHERE result IN ('Draw', 'Loss')

    GROUP BY
        streak_group

),


streak_details AS (

    -- ========================================================
    -- CTE 5: Información contextual de la racha
    -- ========================================================

    SELECT
        ws.streak_group,

        ws.inicio_racha,

        ws.fin_racha,

        ws.partidos_sin_ganar,

        ws.empates,

        ws.derrotas,

        ws.goles_anotados,

        ws.goles_recibidos,

        ws.diferencia_goles,

        MIN(
            CASE
                WHEN sg.match_date = ws.inicio_racha
                THEN sg.opponent
            END
        ) AS primer_rival,

        MIN(
            CASE
                WHEN sg.match_date = ws.fin_racha
                THEN sg.opponent
            END
        ) AS ultimo_rival,

        MIN(
            CASE
                WHEN sg.match_date = ws.inicio_racha
                THEN sg.tournament
            END
        ) AS torneo_inicio,

        MIN(
            CASE
                WHEN sg.match_date = ws.fin_racha
                THEN sg.tournament
            END
        ) AS torneo_final

    FROM winless_streaks AS ws

    INNER JOIN streak_groups AS sg
        ON ws.streak_group = sg.streak_group

    GROUP BY
        ws.streak_group,
        ws.inicio_racha,
        ws.fin_racha,
        ws.partidos_sin_ganar,
        ws.empates,
        ws.derrotas,
        ws.goles_anotados,
        ws.goles_recibidos,
        ws.diferencia_goles

)


-- ============================================================
-- RESULTADO FINAL
-- ============================================================

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

FROM streak_details

ORDER BY
    partidos_sin_ganar DESC,
    inicio_racha ASC

LIMIT 1;
Racha oficial validada

27/10/1957 → 03/11/1960

9 partidos sin ganar
4 empates
5 derrotas
10 goles anotados
21 goles recibidos
−11 diferencia de goles
