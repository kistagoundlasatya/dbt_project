{% macro initcap_macro(s,f,l) %}
    initcap({{s}} || '.'|| {{f}} || ' '|| {{l}})

{% endmacro %}