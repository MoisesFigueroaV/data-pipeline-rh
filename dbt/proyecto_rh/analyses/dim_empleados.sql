{{ config(materialized='table') }}

SELECT
    id_empleado,
    nombre,
    genero,
    area,
    cargo,
    fecha_ingreso,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_ingreso)) AS anios_en_empresa
FROM {{ ref('stg_empleados') }}
WHERE estado = 'Activo'
