# Proyecto Maestro

# 🇲🇽 México2030 Analytics

**Última actualización:** Julio 2026

---

# 1. Visión del Proyecto

Construir una plataforma de Sports Analytics enfocada en analizar el rendimiento histórico y futuro de la Selección Mexicana Mayor Masculina mediante técnicas de Data Engineering, Data Analytics, Business Intelligence y Storytelling.

El proyecto busca convertirse en:

- Portafolio profesional de Data Analytics.
- Plataforma especializada de Sports Analytics.
- Herramienta de análisis rumbo al Mundial 2030.
- Base para futuros modelos predictivos y automatizaciones.

---

# 2. Identidad del Proyecto

## Nombre Oficial

México2030 Analytics

## Marca Analítica

Tricolor Analytics

## Serie Editorial

El Laboratorio del Tri

---

# 3. Objetivos Estratégicos

## Objetivos Profesionales

- Conseguir oportunidades laborales como Data Analyst.
- Especializarse en Sports Analytics.
- Fortalecer la marca personal mediante LinkedIn.
- Construir un portafolio técnico diferenciador.

## Objetivos Técnicos

- Implementar una arquitectura moderna de datos.
- Construir dashboards especializados.
- Mantener una única fuente confiable de información.
- Evolucionar hacia una plataforma analítica rumbo al Mundial 2030.

---

# 4. Alcance Actual

## Incluido

- Selección Mexicana Mayor Masculina.
- Resultados históricos oficiales.
- Procesos ETL con Python.
- Arquitectura Bronze / Silver / Gold.
- Data Warehouse en Google BigQuery.
- Dashboards interactivos en Tableau Public.
- Publicaciones analíticas en LinkedIn.

## Fuera del alcance

- Selección Femenil.
- Selecciones menores.
- APIs deportivas.
- Automatización del pipeline.
- Datos detallados de jugadores.
- Machine Learning.
- Modelos predictivos.

---

# 5. Cobertura Histórica

Fuente oficial:

**International Football Results from 1872 to 2026**

Autor:

Mart Jürisoo (Kaggle)

Cobertura validada para México:

| Métrica | Valor |
|----------|----------|
| Primer partido | 1923-01-01 |
| Último partido | 2026-07-05 |
| Total partidos | 1008 |

---

# 6. Stack Tecnológico

## Data Engineering

- Python
- Pandas
- Jupyter Notebook

## Data Warehouse

- Google BigQuery

## SQL

- BigQuery SQL

## Visualización

- Tableau Public

## Control de Versiones

- GitHub

## Comunicación

- LinkedIn

---

# 7. Arquitectura Implementada

```text
Dataset Kaggle
        ↓
Python ETL
        ↓
BigQuery Bronze
        ↓
BigQuery Silver
        ↓
BigQuery Gold
        ↓
Dashboard Ejecutivo
        ↓
Dashboard Histórico Avanzado
        ↓
Tableau Public
        ↓
LinkedIn
```

---

# 8. Arquitectura de Datos

## Proyecto BigQuery

```
mexico2030analytics
```

## Datasets

### Bronze

- raw_matches

### Silver

- matches

### Gold

- fact_mexico_matches

Granularidad oficial:

> 1 fila = 1 partido de México.

---

# 9. Estado Oficial del Proyecto

## Versión actual

**v1.1.0**

## Estado

✅ MVP COMPLETADO

## Dashboards publicados

- Dashboard Ejecutivo
- Dashboard Histórico Avanzado

---

# 10. Historial de Sprints

| Sprint | Estado | Resultado |
|---------|--------|-----------|
| Sprint 1 | ✅ | Exploración del dataset |
| Sprint 2 | ✅ | Bronze Layer |
| Sprint 3 | ✅ | Silver Layer |
| Sprint 4 | ✅ | Gold Layer |
| Sprint 5 | ✅ | Dashboard Ejecutivo |
| Sprint 6 | ✅ | Auditoría completa del modelo histórico |
| Sprint 7 | ✅ | Dashboard Histórico Avanzado |

---

# 11. Dashboards Oficiales

## Dashboard Ejecutivo

Incluye:

- KPIs de resultados
- Rendimiento histórico
- Competiciones
- Rivales
- Localía

Estado:

✅ Publicado

---

## Dashboard Histórico Avanzado

Incluye:

- KPIs ofensivos
- KPIs defensivos
- Evolución de goles
- Top rivales por goles
- Goles por competición
- Rendimiento ofensivo y defensivo por localía

Estado:

✅ Publicado

---

# 12. Auditoría del Modelo Histórico

Durante el Sprint 6 se realizó una auditoría integral sobre la tabla:

```
gold.fact_mexico_matches
```

## Competiciones auditadas

- Friendly
- FIFA World Cup Qualification
- Gold Cup
- FIFA World Cup
- Copa América
- CONCACAF Nations League

Resultado:

✅ 54 de 54 validaciones aprobadas.

El modelo histórico queda oficialmente validado para el desarrollo de dashboards especializados.

---

# 13. Decisiones Arquitectónicas

## DA-001

Se limita el alcance a la Selección Mexicana Mayor Masculina.

Estado:

✅ Aprobado

---

## DA-002

Arquitectura oficial Bronze / Silver / Gold.

Estado:

✅ Aprobado

---

## DA-003

La tabla oficial para consumo analítico será:

```
gold.fact_mexico_matches
```

Estado:

✅ Aprobado

---

## DA-004

Granularidad oficial:

```
1 fila = 1 partido de México.
```

Estado:

✅ Aprobado

---

## DA-005

Tableau Public será la plataforma oficial de visualización.

Estado:

✅ Aprobado

---

## DA-006

Toda nueva visualización deberá justificarse por valor analítico antes de construirse.

Estado:

✅ Aprobado

---

## DA-007

Se utilizarán filtros exactos sobre el campo:

```
tournament
```

Ejemplo:

```sql
WHERE tournament = 'FIFA World Cup'
```

No se utilizarán filtros tipo:

```sql
LIKE '%World Cup%'
```

Estado:

✅ Aprobado

---

## DA-008

Durante los dashboards especializados se mantendrá una única fuente de datos:

```
gold.fact_mexico_matches
```

No se crearán nuevas tablas hasta finalizar esta etapa.

Estado:

✅ Aprobado

---

## DA-009

El análisis geográfico queda pospuesto hasta incorporar nuevas dimensiones en futuras versiones.

Estado:

✅ Aprobado

---

## DA-010

Todos los dashboards deberán mantener una identidad visual consistente para facilitar la navegación y comparación entre análisis.

Estado:

✅ Aprobado

---

# 14. Roadmap

## ✅ Fase 1 — MVP

- Arquitectura BigQuery
- ETL
- Dashboard Ejecutivo

---

## ✅ Fase 2 — Dashboard Histórico Avanzado

- Métricas ofensivas
- Métricas defensivas
- Goles por competición
- Goles por localía
- Rivales por goles

---

## ⬜ Fase 3 — Dashboard Rivales

- Historial por selección
- Balance histórico
- Diferencia de goles
- Tendencias

---

## ⬜ Fase 4 — Dashboard Mundiales

- Participaciones
- Rendimiento por edición
- Eliminatorias
- Comparativos históricos

---

## ⬜ Fase 5 — Nuevas Capas Analíticas

- Ranking FIFA
- Competiciones
- Scouting
- Nuevas tablas Gold

---

## ⬜ Fase 6 — Automatización

- Integración con APIs
- Actualización automática
- Pipeline programado

---

# 15. Principios del Proyecto

1. Evitar el scope creep.
2. Priorizar valor analítico sobre complejidad técnica.
3. Mantener una única fuente de verdad.
4. Documentar toda decisión importante.
5. Construir dashboards con narrativa clara.
6. Publicar de forma consistente.
7. Mantener una arquitectura escalable.

---

# Regla Oficial del Proyecto

> **"Un análisis publicado vale más que un análisis perfecto que nunca se publica."**


