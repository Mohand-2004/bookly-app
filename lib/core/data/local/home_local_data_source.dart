import 'package:bookly/core/models/book_model.dart';

abstract class HomeLocalDataSource {
  Future<List<Book>> getNewestBooks();

  Future<List<Book>> getFeaturedBooks();

  Future<void> cacheNewestBooks(List<Book> book);

  Future<void> cacheFeaturedBooks(List<Book> books);

  Future<void> deleteNewestBooksCache();

  Future<void> deleteFeaturedBooksCache();
}