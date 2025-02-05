import 'package:bookly/core/database/database_model.dart';

DataBase dataBaseInit(){
  return DataBase(
    path: 'main_database.db',
    onCreateQuereis: <String>[
      """
      CREATE TABLE IF NOT EXISTS featured_books (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        rating REAL NOT NULL,
        rating_count INTIGER NOT NULL,
        image_url TEXT,
        download_link TEXT,
        preview_link TEXT
      );
      """,

      """
      CREATE TABLE IF NOT EXISTS featured_book_authers(
        id TEXT NOT NULL,
        auther_name TEXT NOT NULL,
        FOREIGN KEY(id) REFERENCES featured_books(id)
      );
      """,

      """
      CREATE TABLE IF NOT EXISTS newest_books (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        rating REAL NOT NULL,
        rating_count INTIGER NOT NULL,
        image_url TEXT,
        download_link TEXT,
        preview_link TEXT
      );
      """,

      """
      CREATE TABLE IF NOT EXISTS newest_book_authers(
        id TEXT NOT NULL,
        auther_name TEXT NOT NULL,
        FOREIGN KEY(id) REFERENCES newest_books(id)
      );
      """,
    ]
  );
}