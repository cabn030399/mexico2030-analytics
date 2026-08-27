Proyecto Maestro
🇲🇽 México2030 Analytics

Última actualización: Agosto 2026

1. Visión del Proyecto

Construir una plataforma de Sports Analytics enfocada en analizar el rendimiento histórico y futuro de la Selección Mexicana Mayor Masculina mediante técnicas de Data Engineering, Data Analytics, Business Intelligence y Storytelling.

El proyecto busca convertirse en:

Portafolio profesional de Data Analytics.
Plataforma especializada de Sports Analytics.
Herramienta de análisis rumbo al Mundial 2030.
Base para futuras automatizaciones y nuevas capas analíticas.
2. Identidad del Proyecto
Nombre Oficial

México2030 Analytics

Marca Analítica

Tricolor Analytics

Serie Editorial

El Laboratorio del Tri

3. Objetivos Estratégicos
Objetivos Profesionales
Conseguir oportunidades laborales como Data Analyst.
Especializarse en Sports Analytics.
Fortalecer la marca personal mediante LinkedIn.
Construir un portafolio técnico diferenciador.
Objetivos Técnicos
Implementar una arquitectura moderna de datos.
Construir dashboards especializados.
Mantener una única fuente confiable de información.
Desarrollar análisis históricos reproducibles.
Evolucionar hacia una plataforma analítica rumbo al Mundial 2030.
4. Alcance Actual
Incluido
Selección Mexicana Mayor Masculina.
Resultados históricos disponibles en la fuente principal.
Procesos ETL con Python.
Arquitectura Bronze / Silver / Gold.
Data Warehouse en Google BigQuery.
SQL analítico en BigQuery.
Dashboards interactivos en Tableau Public.
Análisis de récords históricos.
Publicaciones analíticas en LinkedIn.
Documentación técnica y metodológica.
Fuera del alcance
Selección Femenil.
Selecciones menores.
APIs deportivas.
Automatización del pipeline.
Datos detallados de jugadores.
Machine Learning.
Modelos predictivos.
5. Cobertura Histórica
Fuente oficial

International Football Results from 1872 to 2026

Autor:

Mart Jürisoo (Kaggle)

Cobertura validada para México
Métrica	Valor
Primer partido	1923-01-01
Último partido	2026-07-05
Total partidos	1008
6. Stack Tecnológico
Data Engineering
Python
Pandas
Jupyter Notebook
Data Warehouse
Google BigQuery
SQL
BigQuery SQL
Visualización
Tableau Public
Control de Versiones
GitHub
Comunicación
LinkedIn
7. Arquitectura Implementada
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
SQL Analytics
        ↓
Dashboards / Récords Históricos
        ↓
Tableau Public / LinkedIn

La arquitectura oficial mantiene tres capas de datos:

Bronze → Silver → Gold

Los análisis y dashboards consumen principalmente:

gold.fact_mexico_matches
8. Arquitectura de Datos
Proyecto BigQuery
mexico2030analytics
Datasets
Bronze
raw_matches
Silver
matches
Gold
fact_mexico_matches
Granularidad oficial

1 fila = 1 partido de México.

9. Universos Analíticos

La tabla gold.fact_mexico_matches constituye la fuente común para los análisis históricos.

Los análisis de récords se realizan utilizando tres universos metodológicos:

1. Todo el dataset

Incluye todos los partidos disponibles en la tabla Gold.

2. Mayor A / Clase A

Incluye los partidos correspondientes a la Selección Mayor A / Clase A según la metodología definida para el proyecto.

Los amistosos permanecen incluidos cuando corresponden al universo Clase A.

3. Oficiales

Incluye únicamente las competiciones clasificadas como oficiales según la metodología del proyecto.

Los amistosos y competiciones excluidas de la metodología oficial no forman parte de este universo.

La pertenencia a estos universos se determina mediante SQL y reglas metodológicas, sin duplicar la tabla Gold.

10. Estado Oficial del Proyecto
Versión actual

v1.2.0

Estado

✅ MVP COMPLETADO
✅ Modelo histórico validado
✅ Dashboards publicados
✅ Primera biblioteca de récords históricos completada

11. Dashboards Oficiales
Dashboard Ejecutivo

Incluye:

KPIs de resultados
Rendimiento histórico
Competiciones
Rivales
Localía

Estado:

✅ Publicado

Dashboard Histórico Avanzado

Incluye:

KPIs ofensivos
KPIs defensivos
Evolución de goles
Top rivales por goles
Goles por competición
Rendimiento ofensivo y defensivo por localía

Estado:

✅ Publicado

12. Auditoría del Modelo Histórico

Durante el proceso de validación se realizó una auditoría integral sobre:

gold.fact_mexico_matches
Competiciones auditadas
Friendly
FIFA World Cup qualification
Gold Cup
FIFA World Cup
Copa América
CONCACAF Nations League

Resultado:

✅ 54 de 54 validaciones aprobadas

El modelo histórico queda oficialmente validado como fuente para dashboards y análisis históricos.

13. Biblioteca de Récords Históricos

Como nueva etapa analítica se desarrolló una biblioteca de 7 consultas históricas utilizando como fuente:

gold.fact_mexico_matches

Cada récord fue calculado en tres universos:

Todo el dataset
Mayor A / Clase A
Oficiales
Consultas desarrolladas
Consulta	Récord
01	Mayor racha de victorias consecutivas
02	Mayor racha invicta
03	Mayor racha de derrotas consecutivas
04	Mayor racha anotando en partidos consecutivos
05	Mayor racha recibiendo gol en partidos consecutivos
06	Mayor racha de clean sheets consecutivos
07	Mayor racha de partidos sin anotar

Los resultados fueron auditados mediante consultas de detalle sobre los partidos que conforman cada racha.

Principio metodológico

Cada récord distingue explícitamente entre:

dato observado
        ↓
cálculo SQL
        ↓
resultado
        ↓
interpretación

Esto evita presentar una interpretación histórica como si fuera directamente un dato de la fuente.

14. Monitoreo de Récords

Los récords históricos establecidos se consideran récords oficiales del proyecto y serán utilizados como referencia para futuras actualizaciones del dataset.

El objetivo es poder determinar si nuevos partidos de México:

igualan un récord existente;
superan un récord existente;
generan una nueva marca histórica.

Los récords serán monitorizados en los tres universos:

Todo el dataset
Mayor A / Clase A
Oficiales

La metodología de cada universo deberá mantenerse estable para garantizar comparabilidad histórica.

15. Decisiones Arquitectónicas
DA-001

Se limita el alcance a la Selección Mexicana Mayor Masculina.

Estado:

✅ Aprobado

DA-002

Arquitectura oficial:

Bronze / Silver / Gold

Estado:

✅ Aprobado

DA-003

La tabla oficial para consumo analítico será:

gold.fact_mexico_matches

Estado:

✅ Aprobado

DA-004

Granularidad oficial:

1 fila = 1 partido de México.

Estado:

✅ Aprobado

DA-005

Tableau Public será la plataforma oficial de visualización.

Estado:

✅ Aprobado

DA-006

Toda nueva visualización deberá justificarse por valor analítico antes de construirse.

Estado:

✅ Aprobado

DA-007

Se utilizarán filtros exactos sobre el campo:

tournament

Ejemplo:

WHERE tournament = 'FIFA World Cup'

No se utilizarán filtros amplios como:

LIKE '%World Cup%'

cuando el objetivo sea analizar una competición específica.

Estado:

✅ Aprobado

DA-008

Durante los dashboards y análisis históricos se mantendrá una única fuente analítica:

gold.fact_mexico_matches

No se crearán nuevas tablas cuando el análisis pueda resolverse correctamente mediante SQL sobre la estructura existente.

Estado:

✅ Aprobado

DA-009

El análisis geográfico queda pospuesto hasta incorporar nuevas dimensiones en futuras versiones.

Estado:

✅ Aprobado

DA-010

Todos los dashboards deberán mantener una identidad visual consistente para facilitar la navegación y comparación entre análisis.

Estado:

✅ Aprobado

DA-011

Los récords históricos se calcularán separadamente para los tres universos metodológicos:

Todo el dataset
Mayor A / Clase A
Oficiales

Estado:

✅ Aprobado

DA-012

La definición de cada récord deberá ser reproducible mediante SQL y deberá poder auditarse mediante el listado de partidos que conforman la racha.

Estado:

✅ Aprobado

16. Historial de Sprints
Sprint	Estado	Resultado
Sprint 1	✅	Exploración del dataset
Sprint 2	✅	Bronze Layer
Sprint 3	✅	Silver Layer
Sprint 4	✅	Gold Layer
Sprint 5	✅	Dashboard Ejecutivo
Sprint 6	✅	Auditoría completa del modelo histórico
Sprint 7	✅	Dashboard Histórico Avanzado
Sprint 8	✅	Biblioteca de 7 récords históricos
17. Roadmap
✅ Fase 1 — MVP
Arquitectura BigQuery
ETL
Dashboard Ejecutivo
✅ Fase 2 — Dashboard Histórico Avanzado
Métricas ofensivas
Métricas defensivas
Goles por competición
Goles por localía
Rivales por goles
✅ Fase 3 — Récords Históricos
7 consultas analíticas
Tres universos metodológicos
Auditoría de resultados
Registro de récords oficiales
Metodología reproducible
⬜ Fase 4 — Dashboard Rivales
Historial por selección
Balance histórico
Diferencia de goles
Tendencias
⬜ Fase 5 — Dashboard Mundiales
Participaciones
Rendimiento por edición
Eliminatorias
Comparativos históricos
⬜ Fase 6 — Nuevas Capas Analíticas
Ranking FIFA
Competiciones
Scouting
Nuevas tablas Gold
⬜ Fase 7 — Automatización
Integración con APIs
Actualización automática
Pipeline programado
18. Principios del Proyecto
Evitar el scope creep.
Priorizar valor analítico sobre complejidad técnica.
Mantener una única fuente de verdad.
Documentar toda decisión importante.
Construir dashboards con narrativa clara.
Publicar de forma consistente.
Mantener una arquitectura escalable.
Priorizar análisis reproducibles y auditables.
No crear nuevas tablas cuando el modelo existente resuelva correctamente la necesidad.
Diferenciar siempre entre dato, cálculo, interpretación y conclusión.
Regla Oficial del Proyecto

"Un análisis publicado vale más que un análisis perfecto que nunca se publica."

