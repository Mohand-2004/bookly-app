import 'package:bookly/core/models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<Map>> getFeaturedBooks([int pageNumber = 0]);

  Future<List<Map>> getNewestBooks([int pageNumber = 0]);

  Future<List<Map>> getSimilarBooks(Book book,[int pageNumber = 0]);
}