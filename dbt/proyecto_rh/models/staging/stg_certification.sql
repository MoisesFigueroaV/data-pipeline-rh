with source as (
    select * from {{ source('hr', 'overtime') }}
),

clean as (
    select
        certification_id,
        employee_id,
        INITCAP(name) as name,
        TO_DATE(issue_date, 'YYYY-MM-DD') as issue_date
    from source
)

select * from clean
    