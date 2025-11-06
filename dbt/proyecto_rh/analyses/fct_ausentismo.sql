{{ config(materialized='table') }}

SELECT
    a.id_ausencia,
    a.id_empleado,
    e.area,
    e.genero,
    a.fecha_inicio,
    a.fecha_termino,
    a.motivo,
    (a.fecha_termino - a.fecha_inicio) AS dias_ausencia
FROM {{ ref('stg_ausentismo') }} a
LEFT JOIN {{ ref('stg_empleados') }} e
    ON a.id_empleado = e.id_empleado;
