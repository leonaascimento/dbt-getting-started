with books_with_validation_checks as (
	select
		bookid as book_id,
		title,
		authors,
		average_rating as rating_avg,
		average_rating ~ '^\d+(\.\d+)?$' is_rating_avg_valid_number,
		isbn,
		isbn13,
		language_code,
		num_pages,
		num_pages ~ '^\d+(\.\d+)?$' as is_num_pages_valid_number,
		ratings_count,
		ratings_count ~ '^\d+(\.\d+)?$' as is_ratings_count_valid_number,
		text_reviews_count,
		text_reviews_count ~ '^\d+(\.\d+)?$' as is_text_reviews_count_valid_number,
		publication_date,
		publication_date ~ '^(1[0-2]|0?[1-9])/(3[01]|[12][0-9]|0?[1-9])/[0-9]{4}$' as is_pubication_date_valid_mmddyyyy,
		publisher
	from public.books
),
books_with_valid_attributes_only as (
	select *
	from books_with_validation_checks
	where
		is_rating_avg_valid_number = true and
		is_num_pages_valid_number = true and
		is_ratings_count_valid_number = true and
		is_text_reviews_count_valid_number = true and
		is_pubication_date_valid_mmddyyyy = true and
		publication_date not in ('11/31/2000', '6/31/1982')
),
books_with_parsed_attributes as (
	select
		book_id,
		title,
		authors,
		cast(rating_avg as numeric(3,2)) as rating_avg,
		isbn,
		isbn13,
		language_code,
		cast(num_pages as integer) as num_pages,
		cast(ratings_count as integer) as ratings_count,
		cast(text_reviews_count as integer) as text_reviews_count,
		to_date(publication_date, 'MM/DD/YYYY') as publication_date,
		publisher
	from books_with_valid_attributes_only
)
select * from books_with_parsed_attributes
