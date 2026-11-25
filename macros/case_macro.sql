{% macro case_macro(gen) %}
    case when {{gen}} = 'm' then 'Male'
         when {{gen}} = 'f' then 'Female' end
{% endmacro %}