with source as (
    select * from {{ source('hr', 'payroll') }}
),

clean as (
    select
        payroll_id,
        employee_id,
        period,
        base_salary,
        bonuses,
        deductions,
        net_salary,
        TO_DATE(pay_date, 'YYYY-MM-DD') as pay_date,
    from source
)

select * from clean
