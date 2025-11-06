with empleados as (
    select
        id_empleado,
        nombre,
        apellido,
        area,
        fecha_ingreso,
        genero,
        edad
    from {{ ref('stg_empleados') }}
)

select * from empleados
