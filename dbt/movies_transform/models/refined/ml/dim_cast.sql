-- Dimensão de elenco: um ator por linha, derivado da ponte título-ator.

select distinct
    cast_key
from {{ ref('bridge_title_cast') }}
