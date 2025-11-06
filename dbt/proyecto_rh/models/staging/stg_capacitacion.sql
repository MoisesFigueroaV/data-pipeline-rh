with source as (
    select * from {{ source('public', 'capacitacion') }}
),

cleaned as (
    select
        id_capacitacion,
        id_empleado,
        initcap(tema) as tema,
        hours,
        to_date(fecha, 'YYYY-MM-DD') as fecha
    from source
)

select * from cleaned;
