/*
===============================================================================
México2030 Analytics
SQL Analytics Library
===============================================================================

Categoría:
Históricos

Consulta:
01 - Mayor racha de victorias consecutivas

Objetivo:
Identificar la mayor racha de victorias consecutivas de la
Selección Mexicana y mostrar información contextual de dicha racha.

Definición:
Una racha inicia con una victoria y continúa mientras los partidos
siguientes también sean victorias.
La racha termina al registrarse un empate o una derrota.

Tabla:
gold.fact_mexico_matches

Autor:
Carlos Borja

Proyecto:
México2030 Analytics

Módulo:
Match Analytics

Versión:
v1.0.0

===============================================================================
*/


-- ============================================================================
-- CTE 1
-- ordered_matches
--
-- Objetivo:
-- Obtener todos los partidos ordenados cronológicamente e incluir
-- toda la información que necesitaremos durante el algoritmo.
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
-- Objetivo:
-- Obtener el resultado del partido inmediatamente anterior mediante
-- la función LAG().
--
-- Esto permitirá detectar cuándo inicia una nueva racha.
-- ============================================================================

previous_match AS (

    SELECT

        *,

        LAG(result) OVER(
            ORDER BY match_date
        ) AS previous_result

    FROM ordered_matches

),

-- ============================================================================
-- CTE 3
-- streak_groups
--
-- Objetivo:
-- Asignar un identificador único a cada racha.
--
-- Cada vez que aparece un resultado distinto de victoria,
-- se genera un nuevo grupo.
-- ============================================================================

streak_groups AS (

    SELECT

        *,

        SUM(

            CASE

                WHEN result <> 'Win'
                     OR previous_result <> 'Win'
                     OR previous_result IS NULL

                THEN 1

                ELSE 0

            END

        ) OVER(

            ORDER BY match_date

        ) AS streak_group

    FROM previous_match

),

-- ============================================================================
-- CTE 4
-- win_streaks
--
-- Objetivo:
-- Agrupar únicamente las victorias y calcular la duración de cada racha.
-- ============================================================================

win_streaks AS (

    SELECT

        streak_group,

        MIN(match_date) AS inicio_racha,

        MAX(match_date) AS fin_racha,

        COUNT(*) AS victorias_consecutivas,

        SUM(goals_for) AS goles_anotados,

        SUM(goals_against) AS goles_recibidos,

        SUM(goal_difference) AS diferencia_goles

    FROM streak_groups

    WHERE result='Win'

    GROUP BY streak_group

),

-- ============================================================================
-- CTE 5
-- streak_details
--
-- Objetivo:
-- Recuperar el rival y torneo del primer y último partido de la racha.
-- ============================================================================

streak_details AS (

SELECT

    ws.*,

    (
        SELECT opponent
        FROM streak_groups s
        WHERE s.streak_group = ws.streak_group
        ORDER BY match_date
        LIMIT 1
    ) AS primer_rival,

    (
        SELECT opponent
        FROM streak_groups s
        WHERE s.streak_group = ws.streak_group
        ORDER BY match_date DESC
        LIMIT 1
    ) AS ultimo_rival,

    (
        SELECT tournament
        FROM streak_groups s
        WHERE s.streak_group = ws.streak_group
        ORDER BY match_date
        LIMIT 1
    ) AS torneo_inicio,

    (
        SELECT tournament
        FROM streak_groups s
        WHERE s.streak_group = ws.streak_group
        ORDER BY match_date DESC
        LIMIT 1
    ) AS torneo_final

FROM win_streaks ws

)

-- ============================================================================
-- RESULTADO FINAL
-- ============================================================================

SELECT

    inicio_racha,

    fin_racha,

    victorias_consecutivas,

    goles_anotados,

    goles_recibidos,

    diferencia_goles,

    primer_rival,

    ultimo_rival,

    torneo_inicio,

    torneo_final

FROM streak_details

ORDER BY victorias_consecutivas DESC

LIMIT 1;
