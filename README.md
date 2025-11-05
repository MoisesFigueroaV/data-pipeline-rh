# 🧠 Data Pipeline RH

Este proyecto tiene como objetivo construir un **Data Pipeline completo para el área de Recursos Humanos (RH)**, simulando un entorno profesional de **Ingeniería de Datos**.  
Se trabajará con herramientas modernas como **dbt**, **PostgreSQL**, **Docker** y **Python**, siguiendo buenas prácticas de modelado, versionamiento y automatización.

---

## 🚀 Objetivo General

Diseñar y desarrollar un pipeline de datos **escalable y modular**, que permita transformar datos brutos del área de Recursos Humanos en modelos analíticos listos para visualización (dashboards, BI, etc.).

---

## 🧩 Tecnologías Principales

| Componente | Descripción |
|-------------|--------------|
| **dbt (Data Build Tool)** | Framework de transformación de datos SQL modular, orientado a analítica. |
| **PostgreSQL** | Base de datos relacional para almacenar los datos crudos y transformados. |
| **Docker** | Contenedorización para aislar el entorno y facilitar la portabilidad. |
| **Python 3.11+** | Scripts auxiliares para automatización y carga inicial de datos. |
| **Git & GitHub** | Control de versiones y documentación del flujo de trabajo. |

---

## 🏗️ Estructura del Proyecto

```bash
data-pipeline-rh/
├── dbt/
│   ├── proyecto_rh/          # Proyecto principal dbt
│   │   ├── models/
│   │   │   ├── staging/      # Modelos de limpieza y normalización
│   │   │   ├── marts/        # Modelos analíticos (dimensiones y hechos)
│   │   │   ├── schema.yml    # Documentación y tests
│   │   └── dbt_project.yml
│   └── profiles.yml          # Configuración de conexión a la base de datos
│
├── data/
│   ├── raw/                  # Datos brutos (ej: empleados.csv, ausentismo.csv)
│   └── processed/            # Datos transformados o intermedios
│
├── scripts/
│   ├── load_data.py          # Script para cargar datos a PostgreSQL
│   ├── check_connection.py   # Script para probar conexión a la BD
│
├── docker-compose.yml        # Contenedor PostgreSQL
├── requirements.txt          # Dependencias del entorno virtual
└── README.md                 # Documentación principal del proyecto
