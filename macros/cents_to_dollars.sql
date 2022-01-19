{%- macro cents_to_dollars(column_name,descimal_places = 2) -%}
round(1.0*{{ column_name }}/100, {{descimal_places}})
{%- endmacro -%}