/* Warm-up Queries */

-- Before executing these queries, create tables and import data (see create_tables.sql)

-- Return mystery book titles & their ISBNs


-- Return all of the titles and author’s first and last names 
-- for books written by authors who are currently living

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Write a script for loaning a book out (pick any patron and book) */

-- Use variables so you can loan different books to different patrons

-- Change available to false for book

-- Add a record to the loan table with today's date as the date out and the patron and book IDs


-- Update the patron's record with the loan ID

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Write a script for checking a book back in */

-- Use variable to return a different book each time you run the script

-- Lookup loan id and store in a variable

-- Change available to true for book

-- Update record to the loan table with today's date as the date in

-- Update the patron's record to set loan_id to null

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Wrapping up */

-- Return the names of patrons with the genres of books they currently have checked out

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

/* Bonus missions */

-- Return the counts of the books in each genre

 
-- Modify either the book or reference table to prevent a reference book from being checked out
