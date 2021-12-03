{% macro is_number(column_name) -%}
    {{ column_name }}  ~ '^\d+(\.\d+)?$'
{%- endmacro %}
