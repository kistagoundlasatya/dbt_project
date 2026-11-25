{% macro reuse_macro(src_db,trg_db) %}
    {% set var %}
    create database {{trg_db}} clone {{src_db}}
    {%endset %}
    {% do run_query(var) %}
{% endmacro %}