{{ config(materialized='table') }}

SELECT
    e.area,
    e.genero,
    COUNT(e.id_empleado) AS total_empleados,
    CURRENT_DATE AS fecha_actualizacion
FROM {{ ref('stg_empleados') }} e
WHERE e.estado = 'Activo'
GROUP BY e.area, e.genero
