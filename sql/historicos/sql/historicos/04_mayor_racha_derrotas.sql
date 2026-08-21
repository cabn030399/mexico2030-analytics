/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Consulta:
02 - Mayor racha de derrotas consecutivas

Objetivo:
Identificar la mayor racha de derrotas consecutivas de la
Selección Mexicana considerando todos los partidos disponibles
en el dataset.

Definición:
Una racha de derrotas está formada exclusivamente por partidos
con resultado 'Loss'.

Un empate ('Draw') o una victoria ('Win') rompe la racha.

Tabla:
mexico2030analytics.gold.fact_mexico_matches

Granularidad:
1 fila = 1 partido de México

Versión:
v1.0.0

===============================================================================
*/


-- ============================================================================
-- CTE 1
-- ordered_matches
--
-- Obtener los partidos ordenados cronológicamente.
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
-- Crear un identificador para cada racha de derrotas.
--
-- Se crea un nuevo grupo cuando:
--
-- 1. El partido actual NO es derrota.
-- 2. El partido anterior NO fue derrota.
-- 3. No existe partido anterior.
--
-- De esta manera, únicamente los 'Loss' consecutivos pertenecen
-- al mismo grupo.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN result <> 'Loss'
                     OR previous_result <> 'Loss'
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
-- loss_streaks
--
-- Calcular las estadísticas de cada racha de derrotas.
-- ============================================================================

loss_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS derrotas_consecutivas,

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

    WHERE result = 'Loss'

    GROUP BY streak_group

)


-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    derrotas_consecutivas,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM loss_streaks

ORDER BY
    derrotas_consecutivas DESC,
    inicio_racha

LIMIT 1;



La auditoría confirma que los seis partidos son derrotas consecutivas:

#	Fecha	Rival	Torneo	Resultado
1	1950-06-24	Brazil	FIFA World Cup	❌
2	1950-06-28	Yugoslavia	FIFA World Cup	❌
3	1950-07-02	Switzerland	FIFA World Cup	❌
4	1952-03-23	Uruguay	Pan American Championship	❌
5	1952-03-26	Chile	Pan American Championship	❌
6	1952-04-06	Brazil	Pan American Championship	❌
🏆 Récord validado

Mayor racha histórica de derrotas consecutivas: 6 partidos

📅 Inicio: 24/06/1950
📅 Fin: 06/04/1952
⚽ Goles anotados: 3
🥅 Goles recibidos: 19
📉 Diferencia: -16
🇧🇷 Primer rival: Brazil
🇧🇷 Último rival: Brazil
