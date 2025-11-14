with source as (
    select * from {{ source('hr', 'notification') }}
),

clean as (
    select
        notification_id,
        employee_id,
        message,
        TO_DATE(date, 'YYYY-MM-DD') as date,
    from source
)

select * from clean
