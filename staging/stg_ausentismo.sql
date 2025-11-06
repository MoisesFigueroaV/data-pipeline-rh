select
    id_ausencia,
    id_empleado,
    fecha_inicio::date,
    fecha_fin::date,
    tipo
from {{ source('public', 'ausentismo') }}
