import psycopg2
import os

def main():
    print("🚀 Probando conexión a PostgreSQL...")

    try:
        conn = psycopg2.connect(
            host=os.getenv("POSTGRES_HOST", "postgres"),
            port=os.getenv("POSTGRES_PORT", 5432),
            user=os.getenv("POSTGRES_USER", "airflow"),
            password=os.getenv("POSTGRES_PASSWORD", "airflow"),
            dbname=os.getenv("POSTGRES_DB", "airflow")
        )
        print("✅ Conexión a PostgreSQL exitosa.")
        conn.close()
    except Exception as e:
        print("❌ Error al conectar a la base de datos:")
        print(e)

if __name__ == "__main__":
    main()
