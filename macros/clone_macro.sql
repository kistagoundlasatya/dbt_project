{% macro clone_macro(args) %}
    {% set clone_db %}
    drop database Shrini;
    {% endset %}
    {% do run_query(clone_db) %}
{% endmacro %}