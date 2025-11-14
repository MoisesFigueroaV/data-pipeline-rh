with source as (
    select * from {{ source('hr', 'overtime') }}
),

clean as (
    select
        overtime_id,
        employee_id,
        TO_DATE(date, 'YYYY-MM-DD') as date,
        hours,
        cast(approved as boolean) as approved
    from source
)

select * from clean
