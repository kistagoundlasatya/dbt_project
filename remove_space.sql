{% macro remove_space(col) %}
    case when trim({{ col }}) = '' then NULL
         else initcap(trim({{col}})) end
{% endmacro %}