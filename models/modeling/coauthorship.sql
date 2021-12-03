select
    book_id,
    unnest(string_to_array(authors , '/')) as author
from {{ ref('cleanse_books') }}
