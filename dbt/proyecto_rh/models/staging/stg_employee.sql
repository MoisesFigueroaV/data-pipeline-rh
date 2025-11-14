with source as (
    select * from {{ source('hr', 'employee') }}
),

clean as (
    select
        employee_id,
        national_id,
        INITCAP(first_name) as first_name,
        INITCAP(last_name) as last_name,
        TO_DATE(birth_date, 'YYYY-MM-DD') as birth_date,
        gender,
        address,
        email,
        phone,
        TO_DATE(hire_date, 'YYYY-MM-DD') as hire_date,
        INITCAP(employment_type) as employment_type,
    from source
)

select * from clean
