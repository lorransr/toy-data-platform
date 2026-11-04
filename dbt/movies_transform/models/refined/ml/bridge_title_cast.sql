-- Ponte título ↔ ator: uma linha por par (título, ator).
--
-- `cast` é multi-valor como `country`, e também pode vir vazio: títulos sem elenco na
-- origem não entram na ponte. `cast` vai entre aspas porque é palavra reservada no SQL.

select
    f.title_key,
    trim(a.actor) as cast_key,
    f.title_key || '|' || trim(a.actor) as title_cast_key
from {{ ref('fct_titles') }} f
inner join {{ ref('int_titles_attributes') }} t on t.title_key = f.title_key
cross join unnest(split(t."cast", ',')) as a (actor)
where trim(a.actor) <> ''
