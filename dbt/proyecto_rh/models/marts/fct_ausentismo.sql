with ausentismo as (
    select * from {{ ref('stg_ausentismo') }}
),

empleados as (
    select * from {{ ref('stg_empleados') }}
)

select
    a.id_ausencia,
    a.id_empleado,
    e.nombre || ' ' || e.apellido as empleado,
    e.area,
    a.tipo,
    a.fecha_inicio,
    a.fecha_fin,
    (a.fecha_fin - a.fecha_inicio) as dias_ausencia
from ausentismo a
join empleados e on a.id_empleado = e.id_empleado
