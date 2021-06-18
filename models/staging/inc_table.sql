{{ config(
    materialized = 'incremental',
    unique_key = 'name',
    sort = 'name',
    dist = 'name'
) }}

with test_data as (
    select 'casename_1' as name, 'caseid_01' as case_id
    union
    select 'casename_1', 'caseid_02'
    union
    select 'casename_2', 'caseid_03'
    union
    select 'casename_2', 'caseid_04'
    union
    select 'casename_2', 'caseid_05'
    union
    select 'casename_3', 'caseid_06'
    union
    select 'casename_3', 'caseid_07'
    union
    select 'casename_3', 'caseid_08'
    union
    select 'casename_3', 'caseid_09'
    union
    select 'casename_4', 'caseid_10'
     union
     select 'casename_4', 'caseid_11'
     union
     select 'casename_4', 'caseid_12'
     union
     select 'casename_4', 'caseid_13'
--     union
--     select 'casename_4', 'caseid_14'
--     union
--     select 'casename_4', 'caseid_15'
--     union
--     select 'casename_4', 'caseid_16'
--     union
--     select 'casename_4', 'caseid_17'
--     union
--     select 'casename_4', 'caseid_18'
)
select
    name,
    count(distinct case_id) as count,
    current_timestamp  as last_updated
from test_data
group by name
order by count(distinct case_id) desc
limit 3