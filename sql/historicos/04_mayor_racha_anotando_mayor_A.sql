-- ============================================================
-- CONSULTA 04
-- Mayor racha anotando
-- Selección Mayor A
-- México2030 Analytics
-- ============================================================


WITH ordered_matches AS (

    -- ========================================================
    -- CTE 1: Partidos de la Selección Mayor A
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

    WHERE tournament NOT IN (
        'Olympic Games',
        'Central American and Caribbean Games'
    )

),


previous_match AS (

    -- ========================================================
    -- CTE 2: Goles anotados en el partido anterior
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

        LAG(goals_for) OVER (
            ORDER BY match_date, match_id
        ) AS previous_goals_for

    FROM ordered_matches

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
        previous_goals_for,

        SUM(
            CASE
                WHEN goals_for = 0
                     OR previous_goals_for = 0
                     OR previous_goals_for IS NULL
                THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY match_date, match_id
        ) AS streak_group

    FROM previous_match

),


scoring_streaks AS (

    -- ========================================================
    -- CTE 4: Agrupación de partidos consecutivos anotando
    -- ========================================================

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS partidos_anotando,

        SUM(goals_for) AS goles_anotados,

        SUM(goals_against) AS goles_recibidos,

        SUM(goal_difference) AS diferencia_goles

    FROM streak_groups

    WHERE goals_for > 0

    GROUP BY
        streak_group

),


streak_details AS (

    -- ========================================================
    -- CTE 5: Información contextual de la racha
    -- ========================================================

    SELECT
        ss.streak_group,

        ss.inicio_racha,

        ss.fin_racha,

        ss.partidos_anotando,

        ss.goles_anotados,

        ss.goles_recibidos,

        ss.diferencia_goles,

        MIN(
            CASE
                WHEN sg.match_date = ss.inicio_racha
                THEN sg.opponent
            END
        ) AS primer_rival,

        MIN(
            CASE
                WHEN sg.match_date = ss.fin_racha
                THEN sg.opponent
            END
        ) AS ultimo_rival,

        MIN(
            CASE
                WHEN sg.match_date = ss.inicio_racha
                THEN sg.tournament
            END
        ) AS torneo_inicio,

        MIN(
            CASE
                WHEN sg.match_date = ss.fin_racha
                THEN sg.tournament
            END
        ) AS torneo_final

    FROM scoring_streaks AS ss

    INNER JOIN streak_groups AS sg
        ON ss.streak_group = sg.streak_group

    GROUP BY
        ss.streak_group,
        ss.inicio_racha,
        ss.fin_racha,
        ss.partidos_anotando,
        ss.goles_anotados,
        ss.goles_recibidos,
        ss.diferencia_goles

)


-- ============================================================
-- RESULTADO FINAL
-- ============================================================

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

FROM streak_details

ORDER BY
    partidos_anotando DESC,
    inicio_racha ASC

LIMIT 1;

| Métrica           |   Resultado |
| ----------------- | ----------: |
| Inicio            |  05/07/2009 |
| Fin               |  17/03/2010 |
| Partidos anotando |      **15** |
| Goles anotados    |      **37** |
| Goles recibidos   |       **9** |
| Diferencia        |     **+28** |
| Primer rival      |   Nicaragua |
| Último rival      | North Korea |
| Torneo inicial    |    Gold Cup |
| Torneo final      |    Friendly |
Racha Mayor A: 05/07/2009 → 17/03/2010

15 partidos anotando
37 goles a favor
9 goles en contra
+28 diferencia de goles
Los amistosos 0–0 de 2010 rompen la racha
