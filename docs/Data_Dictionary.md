# Data Dictionary

# 🇲🇽 México2030 Analytics

**Última actualización:** Julio 2026

---

# Objetivo

Documentar las tablas, columnas, tipos de datos y definiciones utilizadas en **México2030 Analytics**.

El diccionario diferencia entre estructuras actualmente implementadas y estructuras previstas para futuras fases del proyecto.

---

# DATASET: BRONZE

La capa Bronze representa los datos de origen y mantiene una estructura cercana a la fuente original.

## Tabla: `raw_matches`

**Fuente:**

International Football Results from 1872 to 2026

**Autor:**

Mart Jürisoo

**Archivo origen:**

```text
results.csv
```

### Estructura de origen

| Columna      | Tipo    | Descripción                                        |
| ------------ | ------- | -------------------------------------------------- |
| `date`       | DATE    | Fecha del partido                                  |
| `home_team`  | STRING  | Equipo local                                       |
| `away_team`  | STRING  | Equipo visitante                                   |
| `home_score` | INTEGER | Goles del equipo local                             |
| `away_score` | INTEGER | Goles del equipo visitante                         |
| `tournament` | STRING  | Competición                                        |
| `city`       | STRING  | Ciudad                                             |
| `country`    | STRING  | País                                               |
| `neutral`    | BOOLEAN | Indica si el partido fue disputado en sede neutral |

### Tabla BigQuery

```text
bronze.raw_matches
```

### Estado

✅ Infraestructura implementada

---

## Tabla: `raw_players`

Tabla disponible como parte de la infraestructura Bronze para la futura incorporación de datos de jugadores.

### Tabla BigQuery

```text
bronze.raw_players
```

### Estado

🔄 Planeada para uso analítico

---

## Tabla: `raw_rankings`

Tabla disponible como parte de la infraestructura Bronze para una futura incorporación de datos de ranking FIFA.

### Tabla BigQuery

```text
bronze.raw_rankings
```

### Estado

🔄 Planeada para uso analítico

---

# DATASET: SILVER

La capa Silver contiene datos procesados, normalizados y preparados para análisis.

## Tabla: `matches`

**Descripción:**

Datos históricos de partidos procesados a partir de la fuente `results.csv`.

Durante la transformación se realizan, entre otras, las siguientes operaciones:

* Normalización de fechas.
* Exclusión de registros sin marcador.
* Creación de `match_id`.
* Creación de `match_key`.
* Validación de duplicados.
* Preparación de los campos para almacenamiento en BigQuery.

### Tabla BigQuery

```text
silver.matches
```

### Estado

✅ Implementada

### Resultados de calidad

```text
49,501 registros
49,501 match_id únicos
49,501 match_key únicas
0 match_key duplicadas
0 registros involucrados en duplicados
```

---

## Columnas

| Columna      | Tipo    | Descripción                                                         |
| ------------ | ------- | ------------------------------------------------------------------- |
| `match_id`   | INTEGER | Identificador del partido utilizado dentro de la capa Silver        |
| `match_key`  | STRING  | Clave lógica utilizada para identificar un partido de forma estable |
| `date`       | DATE    | Fecha del partido                                                   |
| `home_team`  | STRING  | Equipo local                                                        |
| `away_team`  | STRING  | Equipo visitante                                                    |
| `home_score` | FLOAT   | Goles del equipo local                                              |
| `away_score` | FLOAT   | Goles del equipo visitante                                          |
| `tournament` | STRING  | Competición                                                         |
| `city`       | STRING  | Ciudad                                                              |
| `country`    | STRING  | País                                                                |
| `neutral`    | BOOLEAN | Indica si el partido fue disputado en sede neutral                  |

---

## `match_key`

La clave lógica del partido se construye mediante:

```text
date|home_team|away_team|tournament
```

Ejemplo conceptual:

```text
2026-08-28|Mexico|Test Team|Test Tournament
```

### Propósito

`match_key` se utiliza para:

* Identificar lógicamente un partido.
* Detectar duplicados.
* Comparar registros existentes contra registros nuevos.
* Implementar el procesamiento incremental.

La estrategia incremental no depende del valor secuencial de `match_id`.

---

# DATASET: GOLD

La capa Gold contiene datos transformados específicamente para análisis de la Selección Mexicana Mayor Masculina.

---

## Tabla: `fact_mexico_matches`

**Descripción:**

Tabla analítica principal del proyecto.

Contiene exclusivamente partidos de la **Selección Mexicana Mayor Masculina**.

### Granularidad

```text
1 fila = 1 partido de México
```

### Tabla BigQuery

```text
gold.fact_mexico_matches
```

### Estado

✅ Implementada

### Cobertura validada

| Métrica                  | Valor      |
| ------------------------ | ---------- |
| Primer partido de México | 1923-01-01 |
| Último partido de México | 2026-07-05 |
| Total de partidos        | 1,008      |

---

## Columnas

| Columna           | Tipo    | Descripción                                      |
| ----------------- | ------- | ------------------------------------------------ |
| `match_id`        | INTEGER | Identificador del partido proveniente de Silver  |
| `match_date`      | DATE    | Fecha del partido                                |
| `year`            | INTEGER | Año del encuentro                                |
| `opponent`        | STRING  | Rival de México                                  |
| `tournament`      | STRING  | Competición                                      |
| `venue_type`      | STRING  | Condición del partido: Home, Away o Neutral      |
| `goals_for`       | FLOAT64 | Goles anotados por México                        |
| `goals_against`   | FLOAT64 | Goles recibidos por México                       |
| `goal_difference` | FLOAT64 | Diferencia entre goles a favor y goles en contra |
| `result`          | STRING  | Resultado del partido: Win, Draw o Loss          |

---

# Tablas Futuras

Las siguientes estructuras forman parte de la evolución prevista del proyecto y no representan actualmente tablas analíticas implementadas.

---

## `fact_fifa_ranking`

**Estado:**

🔄 Planeada

**Descripción:**

Tabla analítica prevista para almacenar información histórica del ranking FIFA y permitir análisis temporal.

---

## `fact_players_pool`

**Estado:**

🔄 Planeada

**Descripción:**

Tabla analítica prevista para almacenar información histórica de jugadores relacionados con la Selección Mexicana Mayor Masculina.

---

# Convenciones

## Venue Type

| Valor     | Descripción                       |
| --------- | --------------------------------- |
| `Home`    | México juega como local           |
| `Away`    | México juega como visitante       |
| `Neutral` | Partido disputado en sede neutral |

---

## Result

| Valor  | Descripción        |
| ------ | ------------------ |
| `Win`  | Victoria de México |
| `Draw` | Empate             |
| `Loss` | Derrota de México  |

---

# Identificadores

## `match_id`

Identificador utilizado para distinguir registros de partidos dentro de la capa Silver.

Es un identificador técnico y no debe utilizarse como criterio principal para determinar si un partido es nuevo durante el procesamiento incremental.

---

## `match_key`

Identificador lógico construido a partir de:

```text
date|home_team|away_team|tournament
```

Su objetivo es proporcionar una referencia estable para la identificación de partidos y la detección incremental.

---

# Reglas de Calidad

Para la capa Silver se validan, como mínimo:

* Ausencia de `match_key` nulas.
* Ausencia de `match_key` duplicadas.
* Unicidad de `match_id`.
* Exclusión de partidos sin marcador.

Resultado validado actualmente:

```text
match_key nulas: 0
match_key duplicadas: 0
match_id duplicados: 0
```

---

# Regla de Gobierno

Toda nueva tabla o estructura analítica aprobada deberá documentarse en este archivo antes de ser utilizada en dashboards o análisis.

El diccionario deberá actualizarse cuando:

* Se incorpore una nueva tabla.
* Se agregue o modifique una columna.
* Cambie el tipo de dato.
* Cambie la definición de una métrica.
* Se incorpore una nueva capa de datos.
* Se modifique una regla de calidad relevante.
