with source as (
    select * from {{ source('hr', 'performance_indicator') }}
),

clean as (
    select
        indicartor_id,
        employee_id,
        name,
        value,
    from source
)

select * from clean
