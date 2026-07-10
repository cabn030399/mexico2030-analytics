# Data Dictionary

# Camino al Mundial 2030

Última actualización: Julio 2026

---

# Objetivo

Documentar todas las tablas, columnas y definiciones utilizadas en el proyecto.

---

# DATASET: BRONZE

## Tabla: raw_matches

Fuente:

International Football Results from 1872 to 2026

Archivo origen:

results.csv

| Columna    | Descripción                              |
| ---------- | ---------------------------------------- |
| date       | Fecha del partido                        |
| home_team  | Equipo local                             |
| away_team  | Equipo visitante                         |
| home_score | Goles del equipo local                   |
| away_score | Goles del equipo visitante               |
| tournament | Competición                              |
| city       | Ciudad donde se disputó el encuentro     |
| country    | País donde se disputó el encuentro       |
| neutral    | Indica si el partido fue en sede neutral |

---

## Tabla: raw_goalscorers

Fuente:

goalscorers.csv

Estado:

No utilizada en MVP.

---

## Tabla: raw_shootouts

Fuente:

shootouts.csv

Estado:

No utilizada en MVP.

---

## Tabla: raw_former_names

Fuente:

former_names.csv

Estado:

No utilizada en MVP.

---

# DATASET: SILVER

## Tabla: matches

Estado:

Pendiente de construcción.

Descripción:

Datos normalizados provenientes de raw_matches.

---

## Tabla: rankings

Estado:

Pendiente de construcción.

Descripción:

Histórico de rankings FIFA normalizados.

---

## Tabla: players

Estado:

Pendiente de construcción.

Descripción:

Catálogo de jugadores de selecciones mexicanas.

---

# DATASET: GOLD

## Tabla: fact_matches

Estado:

Pendiente de construcción.

Descripción:

Tabla analítica principal del proyecto.

Nivel de granularidad:

1 fila = 1 partido.

---

## Tabla: fact_rankings

Estado:

Pendiente de construcción.

Descripción:

Histórico de ranking FIFA para análisis temporal.

---

## Tabla: dim_players

Estado:

Pendiente de construcción.

Descripción:

Dimensión de jugadores seleccionables.

---

# Notas

Toda nueva tabla aprobada deberá documentarse en este archivo antes de ser utilizada en dashboards o modelos analíticos.

