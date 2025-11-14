with source as (
    select * from {{ source('hr', 'vacation') }}
),

clean as (
    select
        vacation_id,
        employee_id,
        days_accumuleted,
        days_taken
    from source
)

select * from clean
