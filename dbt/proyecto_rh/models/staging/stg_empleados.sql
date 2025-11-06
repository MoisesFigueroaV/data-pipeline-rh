select
    id_empleado,
    nombre,
    apellido,
    area,
    cast(fecha_ingreso as date) as fecha_ingreso,
    genero,
    edad
from {{ source('public', 'empleados') }}
