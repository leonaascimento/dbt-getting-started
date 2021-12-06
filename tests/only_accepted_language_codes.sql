select t.*
from {{ ref('cleanse_books') }} t
left join {{ ref('accepted_language_codes') }} u on t.language_code = u.language_code
where u.language_code is null

