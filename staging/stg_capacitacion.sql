select
    id_capacitacion,
    id_empleado,
    tema,
    hours,
    fecha::date
from {{ source('public', 'capacitacion') }}
