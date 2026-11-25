{% macro special_character(data1) %}
    regexp_replace({{data1}},'[^0-9]','')
{% endmacro %}