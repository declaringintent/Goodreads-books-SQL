-- Table: books
CREATE TABLE IF NOT EXISTS books (
    bookID INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    publication_date TEXT,
    isbn TEXT,
    language_code TEXT,
    num_pages INTEGER
);

-- Table: authors
CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Table: book_authors (many-to-many relationship)
CREATE TABLE IF NOT EXISTS book_authors (
    bookID INTEGER,
    author_id INTEGER,
    PRIMARY KEY (bookID, author_id),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Table: book_stats
CREATE TABLE IF NOT EXISTS book_stats (
    bookID INTEGER PRIMARY KEY,
    average_rating REAL,
    ratings_count INTEGER,
    text_reviews_count INTEGER,
    FOREIGN KEY (bookID) REFERENCES books(bookID)
);