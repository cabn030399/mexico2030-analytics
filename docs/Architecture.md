# Architecture Document

# Camino al Mundial 2030

Última actualización: Julio 2026

---

# 1. Objetivo

Definir la arquitectura de datos inicial para el proyecto Camino al Mundial 2030.

La arquitectura está diseñada para soportar el análisis histórico y futuro de las selecciones nacionales masculinas de México rumbo al Mundial 2030.

Principios:

* Simplicidad
* Escalabilidad
* Bajo costo
* Facilidad de mantenimiento
* Orientación a portafolio profesional

---

# 2. Arquitectura General

Fuentes de Datos

↓

Python ETL

↓

BigQuery

↓

Modelo Bronze / Silver / Gold

↓

Tableau Public

↓

LinkedIn y Portafolio

---

# 3. Stack Tecnológico

## Desarrollo

* Python
* Jupyter Notebook
* Visual Studio Code
* Anaconda

## Data Warehouse

* Google BigQuery

## Visualización

* Tableau Public

## Versionamiento

* GitHub

## Publicación

* LinkedIn

---

# 4. Fuentes de Datos (MVP)

## raw_matches

Fuente principal:

* football-data.org

Datos esperados:

* Fecha
* Rival
* Competición
* Resultado
* Local / Visitante

---

## raw_rankings

Fuente principal:

* FIFA Rankings Históricos

Datos esperados:

* Fecha
* Ranking FIFA
* Puntos FIFA

---

## raw_players

Fuente principal:

* API-Football

Datos esperados:

* Nombre
* Posición
* Club
* Edad
* Nacionalidad

---

# 5. Proyecto BigQuery

Proyecto:

mexico2030analytics

---

# 6. Datasets

## bronze

Datos crudos obtenidos desde las fuentes originales.

Tablas:

* raw_matches
* raw_rankings
* raw_players

---

## silver

Datos limpios y normalizados.

Tablas:

* matches
* rankings
* players

---

## gold

Datos listos para análisis y visualización.

Tablas:

* fact_matches
* fact_rankings
* dim_players

---

# 7. Flujo de Datos

1. Extraer datos desde las fuentes externas.
2. Almacenar datos sin transformar en Bronze.
3. Limpiar y normalizar datos en Silver.
4. Construir tablas analíticas en Gold.
5. Consumir tablas Gold desde Tableau Public.
6. Publicar análisis y hallazgos en LinkedIn.

---

# 8. Dashboard MVP

Objetivo:

Publicar el primer dashboard histórico de la Selección Mexicana.

Páginas previstas:

## Página 1

Resumen Histórico

KPIs:

* Partidos
* Victorias
* Empates
* Derrotas
* Porcentaje de victorias
* Goles anotados
* Goles recibidos

---

## Página 2

Ranking FIFA

Visualizaciones:

* Evolución histórica del ranking
* Evolución de puntos FIFA

---

## Página 3

Rivales

Visualizaciones:

* Rivales más enfrentados
* Mejores resultados
* Peores resultados

---

# 9. Alcance Actual

Incluido:

* Selección Mayor Masculina
* Selección Sub-23
* Selección Sub-20

Excluido del MVP:

* Selección Femenil
* Modelos predictivos
* Machine Learning
* Tracking de jugadores
* Eventos avanzados
* Scouting

---

# 10. Evolución Futura

Fase 2

* Automatización ETL
* Nuevas fuentes de datos
* Seguimiento de convocatorias

Fase 3

* Métricas avanzadas
* xG
* Modelos predictivos
* Sports Analytics avanzado

---

# 11. Principio Rector

La prioridad del proyecto es generar análisis consistentes y públicos.

Un dashboard publicado aporta más valor que una arquitectura perfecta sin resultados visibles.

