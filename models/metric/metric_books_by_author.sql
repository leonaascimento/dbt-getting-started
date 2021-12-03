select author, count(distinct book_id)
from {{ ref('coauthorship') }}
group by author 
order by count(*) desc
