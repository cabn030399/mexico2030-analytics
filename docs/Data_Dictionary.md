# Data Dictionary

# 🇲🇽 México2030 Analytics

Última actualización: Julio 2026

---

# Objetivo

Documentar las tablas, columnas y definiciones utilizadas en México2030 Analytics.

---

# DATASET: BRONZE

## Tabla: raw_matches

Fuente:

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo

Archivo origen:

results.csv

| Columna | Tipo | Descripción |
|----------|----------|----------|
| date | DATE | Fecha del partido |
| home_team | STRING | Equipo local |
| away_team | STRING | Equipo visitante |
| home_score | INTEGER | Goles del equipo local |
| away_score | INTEGER | Goles del equipo visitante |
| tournament | STRING | Competición |
| city | STRING | Ciudad |
| country | STRING | País |
| neutral | BOOLEAN | Indica si el partido fue en sede neutral |

Estado:

✅ Implementada

---

## Tabla: raw_goalscorers

Fuente:

goalscorers.csv

Estado:

🔄 Planeada

---

## Tabla: raw_shootouts

Fuente:

shootouts.csv

Estado:

🔄 Planeada

---

## Tabla: raw_former_names

Fuente:

former_names.csv

Estado:

🔄 Planeada

---

# DATASET: SILVER

## Tabla: matches

Descripción:

Datos históricos limpios y normalizados provenientes de raw_matches.

Estado:

✅ Implementada

Resultados de calidad:

- 49,501 registros válidos
- 0 duplicados
- 0 valores nulos

---

### Columnas principales

| Columna | Descripción |
|----------|----------|
| match_id | Identificador único del partido |
| date | Fecha del partido |
| home_team | Equipo local |
| away_team | Equipo visitante |
| home_score | Goles local |
| away_score | Goles visitante |
| tournament | Competición |
| city | Ciudad |
| country | País |
| neutral | Sede neutral |

---

# DATASET: GOLD

## Tabla: fact_mexico_matches

Descripción:

Tabla analítica principal del proyecto.

Contiene exclusivamente partidos de la Selección Mexicana Mayor Masculina.

Granularidad:

```text
1 fila = 1 partido de México
```

Estado:

✅ Implementada

Cobertura:

- Primer partido: 1923-01-01
- Último partido: 2026-07-05
- Total partidos: 1008

---

### Columnas

| Columna | Descripción |
|----------|----------|
| match_id | Identificador único del partido |
| match_date | Fecha del partido |
| year | Año del encuentro |
| opponent | Rival de México |
| tournament | Competición |
| venue_type | Home / Away / Neutral |
| goals_for | Goles anotados por México |
| goals_against | Goles recibidos por México |
| goal_difference | Diferencia de goles |
| result | Win / Draw / Loss |

---

# Tablas Futuras

## fact_fifa_ranking

Estado:

🔄 Planeada

Descripción:

Histórico de ranking FIFA para análisis temporal.

---

## fact_players_pool

Estado:

🔄 Planeada

Descripción:

Información histórica de jugadores convocados.

---

# Convenciones

## Venue Type

| Valor | Descripción |
|----------|----------|
| Home | México juega como local |
| Away | México juega como visitante |
| Neutral | Partido en sede neutral |

---

## Result

| Valor | Descripción |
|----------|----------|
| Win | Victoria |
| Draw | Empate |
| Loss | Derrota |

---

# Regla de Gobierno

Toda nueva tabla aprobada deberá documentarse en este archivo antes de ser utilizada en dashboards o análisis.
# Gold Cup – Auditoría de Calidad de Datos

**Fecha:** 19 de julio de 2026

## Fuentes de validación

* RSSSF
* CONCACAF
* Gold Layer (`gold.fact_mexico_matches`)

## Resultados

* Partidos jugados: 91 ✅
* Victorias: 67 ✅
* Empates: 13 ✅
* Derrotas: 11 ✅
* Porcentaje de victorias: 73.63% ✅
* Partidos como local: 10 ✅
* Partidos como visitante: 8 ✅
* Partidos en sede neutral: 73 ✅
* Top 10 rivales enfrentados: Validado ✅

## Hallazgo detectado

Durante la auditoría se identificó una discrepancia entre la Gold Layer y la visualización "Top 10 Rivales" en Tableau.

### Síntoma

* Panamá (6 partidos) no aparecía en el Top 10.
* Brasil (3 partidos) aparecía dentro del Top 10.
* La visualización mostraba únicamente 8 rivales.

### Causa raíz

Existía un filtro adicional sobre el campo `Opponent` aplicado en la hoja de Tableau.

### Acción correctiva

Se eliminó el filtro `Opponent` y se verificó nuevamente la visualización.

### Resultado

La visualización quedó alineada con la Gold Layer:

* Panamá ocupa la posición 7 con 6 partidos.
* Brasil ocupa la posición 11 con 3 partidos.

## Conclusión

La auditoría confirmó la consistencia entre la Gold Layer y las fuentes externas consultadas. No se detectaron errores de calidad en los datos de Gold Cup. La única incidencia encontrada correspondía a una configuración de visualización en Tableau y fue corregida exitosamente.

**Estado final:** APROBADO ✅

**Score:** 9/9 validaciones aprobadas.
# FIFA World Cup – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la consistencia de las métricas principales del historial de México en Copas del Mundo y comprobar la alineación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Durante la auditoría inicial se detectó que el filtro:

```sql
WHERE tournament LIKE '%World Cup%'
```

incluía dos competiciones diferentes:

| Competición                  | Partidos |
| ---------------------------- | -------: |
| FIFA World Cup qualification |      160 |
| FIFA World Cup               |       65 |

Se corrigió el criterio utilizando únicamente:

```sql
WHERE tournament = 'FIFA World Cup'
```

---

# Resultados validados

## WC-001 — Partidos jugados

Resultado:

**65 partidos**

Estado:

✅ VALIDADO

---

## WC-002 — Victorias

Resultado:

**21 victorias**

Estado:

✅ VALIDADO

---

## WC-003 — Empates

Resultado:

**15 empates**

Estado:

✅ VALIDADO

---

## WC-004 — Derrotas

Resultado:

**29 derrotas**

Estado:

✅ VALIDADO

---

## WC-005 — Porcentaje de victorias

Cálculo:

21 / 65 = 32.31%

Resultado:

**32.31%**

Estado:

✅ VALIDADO

---

# Validación por condición de sede

| Tipo    | Partidos |
| ------- | -------: |
| Neutral |       46 |
| Home    |       14 |
| Away    |        5 |

Comprobación:

46 + 14 + 5 = 65

Estado:

✅ VALIDADO

---

# WC-009 — Top rivales enfrentados

Resultado Gold Layer:

| Posición | Rival       | Partidos |
| -------- | ----------- | -------: |
| 1        | Brazil      |        5 |
| 2        | Germany     |        4 |
| 3        | France      |        4 |
| 4        | Argentina   |        4 |
| 5        | Italy       |        3 |
| 6        | Belgium     |        3 |
| 7        | South Korea |        3 |
| 8        | Netherlands |        2 |
| 9        | England     |        2 |
| 10       | Poland      |        2 |

Validación:

* Orden correcto en Tableau.
* Rivales coinciden con Gold Layer.
* No se detectaron problemas de normalización de nombres.

Estado:

✅ VALIDADO

---

# Hallazgo detectado

## Filtro de competición

Se identificó que usar búsquedas amplias por nombre de torneo puede mezclar:

* Copa del Mundo
* Eliminatorias mundialistas

Acción correctiva:

Definir filtros exactos por competición.

Ejemplo:

Correcto:

```sql
tournament = 'FIFA World Cup'
```

Incorrecto:

```sql
tournament LIKE '%World Cup%'
```

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

## Score final

**9/9 validaciones aprobadas**

Estado:

# APROBADO ✅
# Copa América – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** Copa América
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la consistencia de las métricas históricas de México en Copa América mediante la comparación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'Copa América'
```

Total de registros analizados:

**51 partidos**

---

# Resultados validados

## CA-001 — Partidos jugados

Resultado:

**51 partidos**

Estado:

✅ VALIDADO

---

## CA-002 — Victorias

Resultado:

**20 victorias**

Estado:

✅ VALIDADO

---

## CA-003 — Empates

Resultado:

**14 empates**

Estado:

✅ VALIDADO

---

## CA-004 — Derrotas

Resultado:

**17 derrotas**

Estado:

✅ VALIDADO

---

## CA-005 — Porcentaje de victorias

Cálculo:

20 / 51 = 39.21%

Resultado:

**39.21%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Neutral |       46 |
| Away    |        5 |
| Home    |        0 |

Comprobación:

46 + 5 + 0 = 51

Estado:

✅ VALIDADO

---

# CA-009 — Top 10 rivales enfrentados

| Posición | Rival     | Partidos |
| -------- | --------- | -------: |
| 1        | Chile     |        7 |
| 2        | Uruguay   |        6 |
| 3        | Brazil    |        6 |
| 4        | Ecuador   |        6 |
| 5        | Peru      |        5 |
| 6        | Venezuela |        4 |
| 7        | Argentina |        4 |
| 8        | Bolivia   |        3 |
| 9        | Paraguay  |        3 |
| 10       | Colombia  |        3 |

Validación:

* Orden confirmado en Tableau.
* Valores coinciden con Gold Layer.
* No se detectaron problemas de nombres de rivales.

Estado:

✅ VALIDADO

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score: 9/9 validaciones aprobadas**
# CONCACAF Nations League – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** CONCACAF Nations League
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la calidad y consistencia de las métricas históricas de México en la CONCACAF Nations League mediante la comparación entre:

* Gold Layer
* Dashboard Tableau
* Fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'CONCACAF Nations League'
```

Registros analizados:

**20 partidos**

---

# Resultados validados

## NL-001 — Partidos jugados

Resultado:

**20 partidos**

Estado:

✅ VALIDADO

---

## NL-002 — Victorias

Resultado:

**12 victorias**

Estado:

✅ VALIDADO

---

## NL-003 — Empates

Resultado:

**3 empates**

Estado:

✅ VALIDADO

---

## NL-004 — Derrotas

Resultado:

**5 derrotas**

Estado:

✅ VALIDADO

---

## NL-005 — Porcentaje de victorias

Cálculo:

[
12/20 = 60%
]

Resultado:

**60%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Away    |        9 |
| Home    |        6 |
| Neutral |        5 |

Comprobación:

9 + 6 + 5 = 20

Estado:

✅ VALIDADO

---

# NL-009 — Top rivales enfrentados

Resultado:

| Posición | Rival         | Partidos |
| -------- | ------------- | -------: |
| 1        | Panama        |        5 |
| 2        | Honduras      |        4 |
| 3        | United States |        3 |
| 4        | Jamaica       |        2 |
| 5        | Bermuda       |        2 |
| 6        | Suriname      |        2 |
| 7        | Costa Rica    |        1 |
| 8        | Canada        |        1 |

---

## Observación

La competición cuenta con un número reducido de ediciones, por lo que México solamente registra enfrentamientos contra 8 selecciones diferentes.

No se identificaron problemas de datos.

El Top de rivales fue validado correctamente aunque no alcanza 10 elementos debido al tamaño del universo.

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score final: 9/9 validaciones aprobadas**
# FIFA World Cup Qualification – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** FIFA World Cup qualification
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la calidad y consistencia de las métricas históricas de México en eliminatorias mundialistas mediante:

* Gold Layer
* Dashboard Tableau
* Contraste con fuentes históricas externas

---

# Definición del universo analizado

Se confirmó que el nombre exacto de la competición dentro del modelo es:

```sql
tournament = 'FIFA World Cup qualification'
```

Registros analizados:

**160 partidos**

---

# Resultados validados

## WCQ-001 — Partidos jugados

Resultado:

**160 partidos**

Estado:

✅ VALIDADO

---

## WCQ-002 — Victorias

Resultado:

**105 victorias**

Estado:

✅ VALIDADO

---

## WCQ-003 — Empates

Resultado:

**32 empates**

Estado:

✅ VALIDADO

---

## WCQ-004 — Derrotas

Resultado:

**23 derrotas**

Estado:

✅ VALIDADO

---

# Validación matemática

| Resultado | Partidos |
| --------- | -------: |
| Win       |      105 |
| Draw      |       32 |
| Loss      |       23 |
| Total     |      160 |

Comprobación:

105 + 32 + 23 = 160

Estado:

✅ VALIDADO

---

# WCQ-005 — Porcentaje de victorias

Cálculo:

105 / 160

Resultado:

**65.63%**

Estado:

✅ VALIDADO

---

# Validación por sede

| Tipo    | Partidos |
| ------- | -------: |
| Home    |       84 |
| Away    |       71 |
| Neutral |        5 |

Comprobación:

84 + 71 + 5 = 160

Estado:

✅ VALIDADO

---

# WCQ-009 — Top 10 rivales enfrentados

| Posición | Rival                            | Partidos |
| -------- | -------------------------------- | -------: |
| 1        | United States                    |       24 |
| 2        | Costa Rica                       |       24 |
| 3        | Honduras                         |       22 |
| 4        | Canada                           |       14 |
| 5        | Jamaica                          |       14 |
| 6        | El Salvador                      |       12 |
| 7        | Trinidad and Tobago              |       12 |
| 8        | Panama                           |       10 |
| 9        | Saint Vincent and the Grenadines |        6 |
| 10       | Cuba                             |        4 |

Validación:

* Orden confirmado en Tableau.
* Valores coinciden con Gold Layer.
* Sin problemas de filtros detectados.

Estado:

✅ VALIDADO

---

# Validación externa

Se realizó contraste histórico con fuentes externas relacionadas con:

* estructura de eliminatorias FIFA/CONCACAF
* rivales históricos de México
* formatos de clasificación mundialista

Resultados:

* La separación entre competición final y clasificación es correcta.
* Los rivales principales coinciden con la historia competitiva de CONCACAF.
* La distribución local/visitante corresponde al formato histórico de eliminatorias.

Nota metodológica:

No existe una fuente pública única que presente exactamente el mismo agregado histórico de 160 partidos con el mismo criterio del dataset.

Por lo tanto, la validación externa se considera:

**Validación de consistencia histórica y estructural.**

---

# Resultado final

| Validación       | Estado |
| ---------------- | ------ |
| Partidos jugados | ✅      |
| Victorias        | ✅      |
| Empates          | ✅      |
| Derrotas         | ✅      |
| % Victorias      | ✅      |
| Local            | ✅      |
| Visitante        | ✅      |
| Neutral          | ✅      |
| Top rivales      | ✅      |

# Estado:

APROBADO ✅

**Score final: 9/9 validaciones aprobadas**
# Friendly Matches – Auditoría de Calidad de Datos

**Proyecto:** México2030 Analytics
**Capa validada:** Gold Layer
**Tabla:** `gold.fact_mexico_matches`
**Competición:** Friendly
**Fecha:** 19 de julio de 2026

---

# Objetivo

Validar la calidad y consistencia de los partidos amistosos históricos de México mediante:

* Gold Layer
* Dashboard Tableau
* Contraste histórico externo

---

# Definición del universo analizado

Competición:

```sql
tournament = 'Friendly'
```

Registros analizados:

**485 partidos**

---

# Resultados validados

## FR-001 — Partidos jugados

Resultado:

**485 partidos**

Estado:

✅ VALIDADO

---

## FR-002 — Victorias

Resultado:

**225 victorias**

Estado:

✅ VALIDADO

---

## FR-003 — Empates

Resultado:

**122 empates**

Estado:

✅ VALIDADO

---

## FR-004 — Derrotas

Resultado:

**138 derrotas**

Estado:

✅ VALIDADO

---

# FR-005 — Porcentaje de victorias

Cálculo:

225 / 485

Resultado:

**46.39%**

Estado:

✅ VALIDADO

---

# Distribución por sede

| Tipo    | Partidos |
| ------- | -------: |
| Neutral |      199 |
| Home    |      161 |
| Away    |      125 |

Comprobación:

199 + 161 + 125 = 485

Estado:

✅ VALIDADO

---

# FR-009 — Top 10 rivales

| Posición | Rival         | Partidos |
| -------- | ------------- | -------: |
| 1        | Colombia      |       23 |
| 2        | United States |       23 |
| 3        | Peru          |       21 |
| 4        | Brazil        |       20 |
| 5        | Argentina     |       20 |
| 6        | Ecuador       |       19 |
| 7        | Chile         |       19 |
| 8        | Guatemala     |       17 |
| 9        | Paraguay      |       15 |
| 10       | Uruguay       |       15 |

Estado:

✅ VALIDADO

---

# Validación externa

Se realizó contraste histórico de rivales y estructura competitiva.

Resultado:

Los principales rivales encontrados son consistentes con el historial internacional de México.

Nota:

No existe una fuente pública única con exactamente el mismo agregado histórico de 485 partidos bajo los mismos criterios del dataset.

---

# Resultado final

Estado:

APROBADO ✅

Score:

**9/9 validaciones aprobadas**





