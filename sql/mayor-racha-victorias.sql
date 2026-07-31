/*
===========================================================
México2030 Analytics
SQL Analytics Library

Categoría:
Históricos

Consulta:
01 - Mayor racha de victorias consecutivas

Objetivo:
Identificar la mayor racha de victorias consecutivas de la
Selección Mexicana en toda la historia.

Definición de la métrica:
Una racha comienza con una victoria y continúa mientras
todos los partidos siguientes también sean victorias.
La racha termina al registrarse un empate o una derrota.

Tabla principal:
gold.fact_mexico_matches

Columnas utilizadas:
- match_date
- result

Autor:
Carlos Borja

Versión:
1.0

Última actualización:
2026-07-30
===========================================================
*/

-- ========================================================
-- CTE 1: Ordenar cronológicamente todos los partidos
-- ========================================================

WITH ordered_matches AS (

    SELECT
        match_date,
        result
    FROM `mexico2030analytics.gold.fact_mexico_matches`
    ORDER BY match_date

)

-- La consulta continuará en los siguientes pasos.
