with source as (
    select * from {{ source('hr', 'employee') }}
),

clean as (
    select
        request_id,
        employee_id,
        request_type,
        TO_DATE(date, 'YYYY-MM-DD') ad date,
    from source
)

select * from clean
