# Goodreads Books SQL Project

A mini SQL-Python integration project that analyses a Goodreads Books dataset from Kaggle

## Overview
This project demonstrates:
- SQL fundamentals (CRUD, JOINs, Aggregations, Window Functions)
- Python + SQLite integration
- Data cleaning & analysis in Jupyter Notebook

## Repo structure
goodreads-books-sql/
 - data/ #Raw dataset
 - schema.sql # database schema
 - load_data.py # script to load CSV to SQLite
 - queries.sql # practice queries
 - analysis.ipynb # jupyter notebook
 - README.md #project overview

## How to run

1. Clone the repository:
	```bash
	git clone https://github.com/declaringintent/Goodreads-books-SQL.git
	cd Goodreads-books-SQL
2. Install dependencies:
	```bash
	pip install pandas sqlite3 jupyter matplotlib seaborn
3. Run the loader:
	```bash
	python load_data.py
4. Open Books_Data_Analysis.ipynb to explore SQL queries and charts
