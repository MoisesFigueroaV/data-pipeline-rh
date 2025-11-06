import pandas as pd
from sqlalchemy import create_engine

# Conexión al contenedor PostgreSQL
engine = create_engine("postgresql://airflow:airflow@localhost:5432/airflow")

# Archivos a cargar
datasets = {
    "empleados": "data/raw/empleados.csv",
    "ausentismo": "data/raw/ausentismo.csv",
    "capacitacion": "data/raw/capacitacion.csv",
}

for table_name, path in datasets.items():
    df = pd.read_csv(path)
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print(f"✅ Tabla '{table_name}' cargada correctamente.")
