with source as (
    select * from {{ source('hr', 'training_evaluation') }}
),

clean as (
    select
        evaluation_id,
        training_id,
        result
    from source
)

select * from clean;
