import sqlite3
import pandas as pd
import os

def load_csv_to_db(db_path="books.db", csv_path="books.csv"):
    df = pd.read_csv(csv_path, on_bad_lines='skip')
    df.columns = df.columns.str.strip()
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()


    for _,row in df.iterrows():
        book_id = row.get('bookID')
        title = row['title']
        pub_year = row.get('publication_date', None)#.get because the table has to have a value but the dataset might not have one
        isbn = row.get('isbn', None)
        lang = row.get('language_code', None)
        pages = row.get('num_pages', None)

        cur.execute("""
            INSERT OR IGNORE INTO books(bookID, title, publication_date, isbn,
            language_code, num_pages)
            VALUES (?, ?, ?, ?, ?, ?)""",
            (book_id, title, pub_year, isbn, lang, pages))
        avg = row.get('average_rating', None)
        count = row.get('ratings_count', None)
        tr_count = row.get('text_reviews_count', None)
        cur.execute("""
            INSERT OR IGNORE INTO book_stats(bookID, average_rating, ratings_count, text_reviews_count)
            VALUES (?, ?, ?, ?)""",
            (book_id, avg, count, tr_count))

        authors = row.get('authors', "")
        author_list = [a.strip() for a in authors.split(";")]
        for a in author_list:
            cur.execute("INSERT OR IGNORE INTO authors (name) VALUES (?)", (a,))
            cur.execute("SELECT author_id FROM authors WHERE name = ?", (a,))
            a_id = cur.fetchone()[0]
            cur.execute("""INSERT OR IGNORE INTO book_authors (bookID, author_id) VALUES (?, ?)""", (book_id, a_id))
    conn.commit()
    conn.close()


if __name__ == "__main__":
    load_csv_to_db()
