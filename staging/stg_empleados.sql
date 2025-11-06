select
    id_empleado,
    nombre,
    apellido,
    area,
    fecha_ingreso::date as fecha_ingreso,
    genero,
    edad
from {{ source('public', 'empleados') }}
