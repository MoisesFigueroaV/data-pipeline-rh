with source as (
    select * from {{ source('hr', 'training_participant') }}
),

clean as (
    select
        participant_id,
        employee_id,
        training_id
    from source
)

select * from clean;
