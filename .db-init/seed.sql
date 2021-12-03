drop table if exists books;

create table books (
  bookid integer primary key,
  title varchar,
  authors varchar,
  average_rating varchar,
  isbn varchar,
  isbn13 varchar,
  language_code varchar,
  num_pages varchar,
  ratings_count varchar,
  text_reviews_count varchar,
  publication_date varchar,
  publisher varchar
);
