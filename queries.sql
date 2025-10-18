queries.sql

-- 1. Get top 10 highest rated books (with stats)
SELECT b.title, bs.average_rating, bs.ratings_count
FROM books b
JOIN book_stats bs ON b.bookID = bs.bookID
ORDER BY bs.average_rating DESC
LIMIT 10;

-- 2. Number of books per author
SELECT a.name, COUNT(ba.bookID) AS books_written
FROM authors a
JOIN book_authors ba ON a.author_id = ba.author_id
GROUP BY a.name
ORDER BY books_written DESC
LIMIT 10;

-- 3. Rank books within each language by rating
SELECT
  b.title,
  b.language_code,
  bs.average_rating,
  RANK() OVER (
    PARTITION BY b.language_code
    ORDER BY bs.average_rating DESC
  ) AS rank_in_lang
FROM books b
JOIN book_stats bs ON b.bookID = bs.bookID
ORDER BY b.language_code, rank_in_lang
LIMIT 50;

-- 4. Books with multiple authors
SELECT b.title, COUNT(ba.author_id) as num_authors
FROM books b
JOIN book_authors ba ON b.bookID = ba.bookID
GROUP BY b.title
HAVING num_authors > 1;