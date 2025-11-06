select
    id_capacitacion,
    id_empleado,
    tema,
    hours,
    cast(fecha as date) as fecha
from {{ source('public', 'capacitacion') }}
