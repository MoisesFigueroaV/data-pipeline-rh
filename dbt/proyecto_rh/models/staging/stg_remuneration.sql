with source as (
    select * from {{ source('hr', 'remuneration') }}
),

clean as (
    select
        remuneration_id,
        employee_id,
        period,
        base_salary,
        bonuses,
        discounts,
        net_salary,
        TO_DATE(payment_date, 'YYYY-MM-DD') as payment_date,
        payment_method,
        status,
    from source
)

select * from clean
