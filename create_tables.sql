/* CREATE TABLES & IMPORT DATA FROM CSV FILES */

-- Create book table
CREATE TABLE book (
   book_id INT AUTO_INCREMENT PRIMARY KEY,
   author_id INT,
   title VARCHAR(255),
   isbn INT,
   available BOOL,
   genre_id INT
);

-- Before executing the next query, import records from books.csv to the new book table

-- Create author table
CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birthday DATE,
   deathday DATE
);

-- Before executing the next query, import records from authors.csv to the new author table

-- Create patron table
CREATE TABLE patron (
   patron_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   loan_id INT
);

-- Before executing the next query, import records from patrons.csv to the new patron table

-- Create reference_books table
CREATE TABLE reference_books (
   reference_id INT AUTO_INCREMENT PRIMARY KEY,
   edition INT,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

-- Insert a record for reference_books using edition 5 and book_id 32
INSERT INTO reference_books(edition, book_id)
VALUE (5,32);

-- Create genre table
CREATE TABLE genre (
   genre_id INT PRIMARY KEY,
   genres VARCHAR(100)
);

-- Before executing the next query, import records from genres.csv to the new genre table

-- Create loan table 
CREATE TABLE loan (
   loan_id INT AUTO_INCREMENT PRIMARY KEY,
   patron_id INT,
   date_out DATE,
   date_in DATE,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

-- Now you're ready to write queries (see write_queries.sql)
