select
    id_ausencia,
    id_empleado,
    cast(fecha_inicio as date) as fecha_inicio,
    cast(fecha_fin as date) as fecha_fin,
    tipo
from {{ source('public', 'ausentismo') }}
