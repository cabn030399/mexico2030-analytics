# Proyecto Maestro

# Camino al Mundial 2030

Última actualización: Julio 2026

---

# 1. Visión del Proyecto

Construir una plataforma de Sports Analytics enfocada en las selecciones nacionales masculinas de México para analizar su evolución desde 2014 hasta el Mundial 2030.

El proyecto combinará ingeniería de datos, analítica, visualización y generación de contenido para construir una marca profesional en Sports Analytics.

---

# 2. Marca del Proyecto

## Nombre Principal

Camino al Mundial 2030

## Marca Analítica

Tricolor Analytics

## Serie Editorial

El Laboratorio del Tri

---

# 3. Objetivos Estratégicos

1. Conseguir oportunidades laborales en análisis de datos.
2. Especializarse en Sports Analytics.
3. Construir una marca personal sólida en LinkedIn.
4. Crear un portafolio diferenciador.
5. Desarrollar una plataforma pública de análisis futbolístico.

---

# 4. Alcance Aprobado

## Incluido

* Selección Mexicana Mayor Masculina
* Selección Mexicana Sub-23
* Selección Mexicana Sub-20

## Excluido

* Selección Femenil
* Categorías menores distintas de Sub-20
* Clubes de liga como foco principal

---

# 5. Periodo de Análisis

Inicio histórico:

2014

Fin estimado:

2030

---

# 6. Enfoque Analítico

Para cada partido se buscará analizar:

* Rendimiento de México
* Rendimiento del rival
* Historial entre ambos equipos
* Tendencias recientes
* Jugadores destacados
* Convocatorias
* Rendimiento por entrenador
* Rendimiento por torneo

---

# 7. Stack Tecnológico Aprobado

Lenguaje:

* Python

Base de Datos:

* BigQuery

Visualización:

* Tableau Public

Control de Versiones:

* GitHub

Publicación:

* LinkedIn

---

# 8. Arquitectura Aprobada (MVP)

API-Football
↓
Python ETL
↓
BigQuery
↓
SQL
↓
Tableau Public
↓
LinkedIn

---

# 9. Arquitectura de Datos

Datasets BigQuery:

* mexico2030_bronze
* mexico2030_silver
* mexico2030_gold

Modelo:

Bronze → Datos crudos

Silver → Datos limpios y normalizados

Gold → KPIs y modelos analíticos

---

# 10. Fuentes de Datos Aprobadas

## Fase Inicial

* API-Football

## Fase Secundaria

* football-data.org

## Futuro

* soccerdata
* FBref
* StatsBomb Open Data
* Transfermarkt

---

# 11. Restricciones del Proyecto

Tiempo disponible:

Mínimo 5 horas por semana.

Prioridad:

Consistencia y continuidad sobre complejidad técnica.

---

# 12. Regla Oficial del Proyecto

Un análisis publicado vale más que un análisis perfecto que nunca se publica.

---

# 13. Próximo Objetivo

Diseñar el modelo físico de datos en BigQuery.

Entregables pendientes:

* Nombre oficial del proyecto BigQuery
* Tablas Bronze
* Tablas Silver
* Tablas Gold
* MVP Dashboard v1
* ## MVP Dashboard V1

Objetivo:

Publicar el primer dashboard de Tricolor Analytics.

Páginas:

1. Resumen Histórico México 2014-Presente
2. Evolución Ranking FIFA
3. Análisis de Rivales

Tablas requeridas:

gold.fact_matches
gold.fact_rankings

Tabla opcional:

gold.dim_players

# 14. Decisiones Aprobadas

## DA-001
Fecha: 2026-07-09

Se excluye la Selección Femenil del alcance inicial.

Motivo:
Reducir complejidad y enfocarse en Selección Mayor, Sub-23 y Sub-20.

Estado:
Aprobado.

---

## DA-002
Fecha: 2026-07-09

Se adopta arquitectura Bronze / Silver / Gold.

Estado:
Aprobado.

---

## DA-003
Fecha: 2026-07-09

API-Football será la fuente principal para el MVP.

Estado:
Aprobado.
DA-004

Proyecto BigQuery:
mexico2030analytics

Estado:
Aprobado
DA-005

La fase de planificación inicial queda concluida.

El proyecto entra en fase de ejecución.

Fecha:
Julio 2026
DA-007

Infraestructura inicial creada.

Completado:
- Repositorio GitHub
- Estructura de carpetas
- README.md
- Project_Master.md

Estado:
Finalizado

Fecha:
Julio 2026
DA-009

Fuentes de datos MVP aprobadas

raw_matches  -> football-data.org
raw_rankings -> FIFA Rankings históricos
raw_players  -> API-Football

Motivo:
Minimizar complejidad inicial y acelerar la construcción del Dashboard V1.

Estado:
Aprobado
DA-010

Documento Architecture.md creado.

Objetivo:
Centralizar las decisiones técnicas y la arquitectura del proyecto.

Estado:
Completado.
DA-011

Se adopta una estrategia híbrida para raw_matches.

Fase MVP:
Dataset histórico consolidado (CSV).

Fase de automatización:
football-data.org.

Motivo:
Reducir complejidad inicial, acelerar el Dashboard V1 y construir la automatización sobre una base ya validada.

Estado:
Aprobado.
DA-012

Dataset histórico oficial aprobado para el MVP.

Nombre:
International Football Results from 1872 to 2026

Autor:
Mart Jürisoo

Fuente:
Kaggle

Archivo principal:
results.csv

Archivos futuros:
shootouts.csv
goalscorers.csv

Motivo:
Cobertura histórica completa, alta calidad, amplia adopción por la comunidad de analítica deportiva y compatibilidad con BigQuery y Tableau.

Estado:
Aprobado.
DA-014

Archivos oficiales del Dataset Histórico v1.0

results.csv
goalscorers.csv
shootouts.csv
former_names.csv

Fuente:
International Football Results from 1872 to 2026 (Kaggle)

Estado:
Aprobado
DA-015

Documentación base completada.

Archivos creados:

- Project_Master.md
- Architecture.md
- Data_Dictionary.md
- Changelog.md

Estado:
Completado

Fecha:
Julio 2026
### Sprint 3 - Silver Layer

Estado: COMPLETADO

Entregables:

- 003_silver_matches.ipynb
- matches_silver.csv

Resultados:

- 49,501 partidos históricos validados.
- 0 registros duplicados.
- 0 valores nulos.
- match_id generado.

Estado:

Aprobado.
Se aprueba fact_mexico_matches como primera tabla Gold oficial.

Granularidad:
1 fila = 1 partido de México.

Esta tabla será la fuente principal del Dashboard Tableau V1.