with source as (
    select * from {{ source('public', 'ausentismo') }}
),

cleaned as (
    select
        id_ausencia,
        id_empleado,
        to_date(fecha_inicio, 'YYYY-MM-DD') as fecha_inicio,
        to_date(fecha_fin, 'YYYY-MM-DD') as fecha_fin,
        initcap(tipo) as tipo
    from source
)

select * from cleaned;
