{% macro is_date_mmddyyyy(column_name, separator = '/') -%}
    {{ column_name }}  ~ '^(1[0-2]|0?[1-9]){{ separator }}(3[01]|[12][0-9]|0?[1-9]){{ separator }}[0-9]{4}$'
{%- endmacro %}
