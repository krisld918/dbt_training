{% macro get_sql_results(sql_query) -%}
    {% call statement ('sql_query', fetch_result=True) %}
        {{ sql_query }}
    {% endcall %}
    {{ return(load_result('sql_query')['data'] | map(attribute=0) | list) }}
{%- endmacro %}