import 'package:bookly/core/models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<Map>> getFeaturedBooks();

  Future<List<Map>> getNewestBooks();

  Future<List<Map>> getSimilarBooks(Book book,);
}