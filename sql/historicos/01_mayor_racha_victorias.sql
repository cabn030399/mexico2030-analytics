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
Selección Mexicana mostrando información contextual.

Definición:
Una racha comienza con una victoria y continúa mientras los
partidos siguientes también sean victorias.
La racha termina al registrarse un empate o una derrota.

Tabla principal:
gold.fact_mexico_matches

Columnas utilizadas:
- match_date
- opponent
- tournament
- goals_for
- goals_against
- goal_difference
- result

Salida:
- Fecha de inicio
- Fecha de fin
- Número de victorias consecutivas
- Goles anotados
- Goles recibidos
- Diferencia de goles
- Primer rival
- Último rival
- Primer torneo
- Último torneo

Autor:
Carlos Borja

Proyecto:
México2030 Analytics

Módulo:
Match Analytics

Versión:
v2.0.0

Última actualización:
2026-07-30

===============================================================================
*/

-- ============================================================================
-- CTE 1
-- Preparar y ordenar cronológicamente los partidos.
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
-- Obtener el resultado del partido anterior.
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
-- Crear identificadores de rachas.
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
-- Calcular estadísticas de cada racha de victorias.
-- ============================================================================

win_streaks AS (

SELECT

    streak_group,

    MIN(match_date) AS inicio_racha,

    MAX(match_date) AS fin_racha,

    COUNT(*) AS victorias_consecutivas,

    SUM(goals_for) AS goles_anotados,

    SUM(goals_against) AS goles_recibidos,

    SUM(goal_difference) AS diferencia_goles,

    ARRAY_AGG(opponent ORDER BY match_date LIMIT 1)[OFFSET(0)] AS primer_rival,

    ARRAY_AGG(opponent ORDER BY match_date DESC LIMIT 1)[OFFSET(0)] AS ultimo_rival,

    ARRAY_AGG(tournament ORDER BY match_date LIMIT 1)[OFFSET(0)] AS torneo_inicio,

    ARRAY_AGG(tournament ORDER BY match_date DESC LIMIT 1)[OFFSET(0)] AS torneo_final

FROM streak_groups

WHERE result='Win'

GROUP BY streak_group

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

FROM win_streaks

ORDER BY victorias_consecutivas DESC,
         inicio_racha

LIMIT 1;

RESULTADO DE LA CONSULTA 30/JULIO/2026:
    Fila	inicio_racha	fin_racha	victorias_consecutivas	goles_anotados	goles_recibidos	diferencia_goles	primer_rival	ultimo_rival	torneo_inicio	torneo_final
  1	1987-01-13	1990-04-17	13	40.0	9.0	31.0	El Salvador	Colombia	Friendly	Friendly	
===============================================================================
DESCRIPCIÓN DEL ALGORITMO
===============================================================================

CTE 1 - ordered_matches
-----------------------
Selecciona los campos necesarios para el análisis y prepara
los partidos en orden cronológico.

CTE 2 - previous_match
----------------------
Utiliza la función LAG() para obtener el resultado del partido
anterior. Esto permite detectar cuándo una racha comienza.

CTE 3 - streak_groups
---------------------
Mediante una suma acumulada (SUM OVER) se asigna un identificador
único a cada racha de victorias consecutivas.

CTE 4 - win_streaks
-------------------
Agrupa únicamente los partidos ganados y calcula:

• Fecha de inicio.
• Fecha de fin.
• Número de victorias.
• Goles anotados.
• Goles recibidos.
• Diferencia de goles.
• Primer rival.
• Último rival.
• Primer torneo.
• Último torneo.

Resultado final
---------------
Ordena todas las rachas por número de victorias consecutivas y
devuelve únicamente la mayor racha histórica.

===============================================================================
