with source as (
    select * from {{ source('public', 'performance_evaluation') }}
),

cleaned as (
    select
        evaluation_id,
        employee_id,
        period,
        result
    from source
)

select * from cleaned
