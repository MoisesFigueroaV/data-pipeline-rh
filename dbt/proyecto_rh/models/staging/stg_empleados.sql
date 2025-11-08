with source as (
    select * from {{ source('public', 'empleados') }}
),

cleaned as (
    select
        id_empleado,
        initcap(nombre) as nombre,
        initcap(apellido) as apellido,
        upper(area) as area,
        to_date(fecha_ingreso, 'YYYY-MM-DD') as fecha_ingreso,
        genero,
        edad
    from source
)

select * from cleaned
