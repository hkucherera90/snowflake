{% macro date_trunc(input_date) -%}
to_date(to_varchar(date_trunc('day',{{input_date}}),'yyyy-mm-dd'),'yyyy-mm-dd')
{%- endmacro %}