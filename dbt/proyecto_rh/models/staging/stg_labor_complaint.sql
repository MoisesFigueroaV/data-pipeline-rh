with source as (
    select * from {{ source('hr', 'labor_complaint') }}
),

clean as (
    select
        complaint_id,
        employee_id,
        description,
        TO_DATE(date, 'YYYY-MM-DD') as date,
    from source
)

select * from clean
