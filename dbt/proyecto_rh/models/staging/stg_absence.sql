with source as (
    select * from {{ source('hr', 'absence') }}
),

clean as (
    select
        absence_id::integer,
        employee_id::integer,
        TO_DATE(start_date, 'YYYY-MM-DD') as start_date,
        TO_DATE(end_date, 'YYYY-MM-DD') as end_date,
        reason::varchar(255),
    from source
)

select * from clean
