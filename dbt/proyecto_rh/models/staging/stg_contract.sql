with source as (
    select * from {{ source('hr', 'contract') }}
),

clean as (
    select
        contract_id,
        employee_id,
        cost_center_id,
        DATE(start_date) as start_date,
        DATE(end_date) as end_date,
        work_schelude,
        status,
    from source
)

select * from clean
