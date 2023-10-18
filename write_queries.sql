/* Warm-up Queries */

-- Before executing these queries, create tables and import data (see create_tables.sql)

-- Return mystery book titles & their ISBNs
SELECT title, isbn FROM book
WHERE genre_id = 6;

-- Return all of the titles and author’s first and last names 
-- for books written by authors who are currently living
SELECT book.title, author.first_name, author.last_name
FROM book
INNER JOIN author ON book.author_id = author.author_id
WHERE author.deathday IS null;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Write a script for loaning a book out (pick any patron and book) */

-- Use variables so you can loan different books to different patrons
SET @book_loaned=31, @patron=42; 

-- Change available to false for book
UPDATE book 
SET available=0 
WHERE book_id = @book_loaned;

-- Add a record to the loan table with today's date as the date out and the patron and book IDs
INSERT INTO loan(date_out, patron_id, book_id)
VALUES(CURRENT_DATE(), @patron, @book_loaned);

-- Update the patron's record with the loan ID
UPDATE patron 
SET loan_id=(
	SELECT loan_id FROM loan 
	WHERE (patron_id = @patron) AND (date_out = CURRENT_DATE())
) 
WHERE patron_id = @patron;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Write a script for checking a book back in */

-- Use variable to return a different book each time you run the script
SET @returned_book_id=13;

-- Lookup loan id and store in a variable
SET @book_loan_id=(
	SELECT loan_id FROM loan 
	WHERE (book_id = @returned_book_id) AND (date_in IS null)
);

-- Lookup patron id and store in a variable
SET @returning_patron_id = (
	SELECT patron_id from loan
    WHERE loan_id = @book_loan_id
);

-- Change available to true for book
UPDATE book 
SET available=1 
WHERE book_id = @returned_book_id;

-- Update record to the loan table with today's date as the date in
UPDATE loan 
SET date_in=CURRENT_DATE() 
WHERE loan_id = @book_loan_id;

-- Update the patron's record to set loan_id to null
UPDATE patron 
SET loan_id=null 
WHERE patron_id = @returning_patron_id;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Wrapping up */

-- Return the names of patrons with the genres of books they currently have checked out
SELECT patron.first_name, patron.last_name, genre.genres
FROM patron
INNER JOIN loan ON patron.loan_id = loan.loan_id
INNER JOIN book ON book.book_id = loan.book_id
INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE loan.date_in IS null;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Bonus missions */

-- Return the counts of the books in each genre
SELECT genre.genres, COUNT(*)
FROM genre INNER JOIN book
ON genre.genre_id = book.genre_id
GROUP BY genre.genres
ORDER BY genre.genres;
 
-- Modify either the book or reference table to prevent a reference book from being checked out
UPDATE book
SET available = CASE
	WHEN genre_id = 25 THEN 0
    ELSE available
    END
WHERE book_id > 0; /* Check all books */
