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
