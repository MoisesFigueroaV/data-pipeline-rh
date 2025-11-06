with capacitacion as (
    select * from {{ ref('stg_capacitacion') }}
),

empleados as (
    select * from {{ ref('stg_empleados') }}
)

select
    c.id_capacitacion,
    c.id_empleado,
    e.nombre || ' ' || e.apellido as empleado,
    e.area,
    c.tema,
    c.hours,
    c.fecha
from capacitacion c
join empleados e on c.id_empleado = e.id_empleado
