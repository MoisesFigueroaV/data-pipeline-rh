# 🧠 Data Pipeline RH

Este proyecto tiene como objetivo construir un **Data Pipeline completo para el área de Recursos Humanos (RH)**, simulando un entorno profesional de **Ingeniería de Datos**.  
Se utilizan herramientas modernas como **dbt**, **PostgreSQL**, **Docker** y **Python**, siguiendo buenas prácticas de modelado, versionamiento y automatización.

---

## 🎯 Objetivo General

Diseñar y desarrollar un pipeline de datos **escalable y modular**, que permita transformar datos brutos del área de Recursos Humanos en modelos analíticos listos para visualización (dashboards, BI, etc.).

---

## 🧩 Tecnologías Principales

| Componente | Descripción |
|-------------|-------------|
| **dbt (Data Build Tool)** | Framework de transformación de datos SQL modular, orientado a analítica. |
| **PostgreSQL** | Base de datos relacional para almacenar datos crudos y transformados. |
| **Docker** | Contenedorización para aislar el entorno y facilitar la portabilidad. |
| **Python 3.11+** | Scripts auxiliares para carga inicial y automatización de procesos. |
| **Git & GitHub** | Control de versiones y documentación del flujo de trabajo. |

---

## 🗂️ Estructura del Proyecto

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
```

---

## 🚀 1. Preparación del Entorno

### 🪄 Crear entorno virtual

```bash
python3 -m venv venv
source venv/bin/activate
```

Crea un entorno Python aislado para instalar dependencias sin afectar el sistema global.

### 📦 Instalar dbt y adaptador PostgreSQL

```bash
pip install dbt-postgres
```

Instala dbt y el adaptador necesario para conectarse a PostgreSQL.

---

## 🐳 2. Configuración de Docker y PostgreSQL

### ⚙️ Levantar contenedor de PostgreSQL

```bash
docker run --name postgres_dbt   -e POSTGRES_USER=airflow   -e POSTGRES_PASSWORD=airflow   -e POSTGRES_DB=airflow   -p 5432:5432 -d postgres:16
```

Inicia un contenedor llamado `postgres_dbt` con usuario y base `airflow`, exponiendo el puerto 5432 al host local.

### 🔍 Verificar que el contenedor esté corriendo

```bash
docker ps
```

Muestra los contenedores activos y sus puertos.

### 💻 Conectarse a la base dentro del contenedor

```bash
docker exec -it postgres_dbt bash
psql -U airflow -d airflow
```

Permite acceder a PostgreSQL dentro del contenedor.

### 🧑‍💻 Comandos útiles de psql

```sql
\du    -- lista roles
\l     -- lista bases de datos
```

Si el rol `airflow` no existe:

```sql
CREATE ROLE airflow WITH LOGIN PASSWORD 'airflow';
ALTER ROLE airflow CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE airflow TO airflow;
```

### 🧱 Verificar conflictos de puerto con Postgres local

```bash
lsof -i :5432
```

Si tienes una instancia local en ejecución:

```bash
brew services stop postgresql
```

---

## 🧠 3. Configuración de dbt

### ⚙️ Archivo `profiles.yml`

Ubicación: `~/.dbt/profiles.yml`

```yaml
proyecto_rh:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: airflow
      password: airflow
      port: 5432
      dbname: airflow
      schema: public
      threads: 4
```

Define la conexión de dbt hacia la base de datos dentro del contenedor Docker.

### ✅ Verificar conexión con la base

```bash
dbt debug
```

Resultado esperado:

```text
Connection test: OK
profiles.yml file [OK found and valid]
dbt_project.yml file [OK found and valid]
```

---

## 📊 4. Ejecución, Pruebas y Documentación

### 🚀 Ejecutar modelos

```bash
dbt run
```

Crea las tablas o vistas definidas en tus modelos SQL dentro de PostgreSQL.

### ✅ Ejecutar pruebas

```bash
dbt test
```

Valida la calidad e integridad de los datos definidos en tus tests.

### 🧾 Generar y servir documentación

```bash
dbt docs generate && dbt docs serve
```

Genera la documentación interactiva y la sirve localmente en  
👉 [http://localhost:8080](http://localhost:8080)

---

## ⚙️ 5. Cómo Funciona Todo Junto

```text
 ┌─────────────────────────┐
 │       dbt (local)       │
 │ - Corre en entorno venv │
 │ - Ejecuta SQL + Jinja   │
 │ - Genera modelos/tests  │
 │ - Produce documentación │
 └──────────┬──────────────┘
            │
        (localhost:5432)
            │
 ┌─────────────────────────┐
 │    Docker (Postgres)    │
 │ - Base de datos airflow │
 │ - Contenedor aislado    │
 │ - Guarda tablas dbt     │
 └─────────────────────────┘
```

dbt se conecta al puerto 5432 local, que redirige al contenedor Docker (`postgres_dbt`).  
Toda la transformación y persistencia ocurre dentro de esa base PostgreSQL, completamente aislada del sistema.

---

## 🧰 6. Comandos Útiles de Referencia

| Comando | Descripción |
|----------|-------------|
| `docker ps` | Ver contenedores activos |
| `docker exec -it postgres_dbt bash` | Entrar al contenedor |
| `psql -U airflow -d airflow` | Conectarse a la base |
| `dbt debug` | Verificar conexión y configuración |
| `dbt run` | Ejecutar modelos |
| `dbt test` | Correr validaciones |
| `dbt docs generate` | Generar documentación |
| `dbt docs serve` | Servir documentación en localhost:8080 |

---

## ✨ Resultado Final

✅ dbt se conecta correctamente a PostgreSQL en Docker  
✅ Los modelos se ejecutan exitosamente  
✅ Los tests validan la integridad de los datos  
✅ La documentación es accesible en [http://localhost:8080](http://localhost:8080)

---

## 👨‍💻 Autor

**Moisés Figueroa**  
📅 Proyecto: *Data Pipeline RH*  
🔗 Tecnologías: dbt • PostgreSQL • Docker • Python • Jinja2
