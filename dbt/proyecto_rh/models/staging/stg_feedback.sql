with source as (
    select * from {{ source('hr', 'feedback') }}
),

clean as (
    select
        feedback_id,
        employee_id,
        comment,
        TO_DATE(date, 'YYYY-MM-DD') as date,
    from source
)

select * from clean
