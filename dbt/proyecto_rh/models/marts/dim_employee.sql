with empleados as (
    select
        employee_id,
        national_id
        first_name,
        last_name,
        birth_date,
        gender,
        address,
        email,
        phone,
        hire_date,
        employment_type,
        
    from {{ ref('stg_employee') }}
)

select * from empleados
