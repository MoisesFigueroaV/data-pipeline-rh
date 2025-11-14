with source as (
    select * from {{ source('hr', 'absence') }}
),

clean as (
    select
        attendance_id::integer,
        employee_id::integer,
        to_date(date, 'YYYY-MM-DD') as date,
        to_date(check_in_time, 'YYYY-MM-DD') as check_in_time
        to_date(check_out_time, 'YYYY-MM-DD') as check_out_time
    from source
)

select * from clean
