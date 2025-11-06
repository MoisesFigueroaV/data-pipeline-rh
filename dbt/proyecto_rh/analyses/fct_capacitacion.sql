{{ config(materialized='table') }}

SELECT
    c.id_capacitacion,
    c.id_empleado,
    e.area,
    e.genero,
    c.nombre_capacitacion,
    c.fecha_inicio,
    c.fecha_termino,
    (c.fecha_termino - c.fecha_inicio) AS duracion_dias
FROM {{ ref('stg_capacitacion') }} c
LEFT JOIN {{ ref('stg_empleados') }} e
    ON c.id_empleado = e.id_empleado;
