import 'package:bookly/core/data/remote/home_remote_data_source.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:dio/dio.dart';

class GoogleApiHomeDataSourecImplementation implements HomeRemoteDataSource {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();

  @override
  Future<List<Map>> getNewestBooks([int pageNumber = 0]) async {
    var response = await _dio.get("${_baseUrl}volumes?q=subjet:Programming&Filtering=free-ebooks&startIndex=${pageNumber*10}&Sorting=newest");
    return List<Map>.from(response.data['items']);
  }

  @override
  Future<List<Map>> getFeaturedBooks([int pageNumber = 0]) async {
    var response = await _dio.get("${_baseUrl}volumes?Filtering=free-ebooks&startIndex=${pageNumber*10}&q=subjet:Programming");
    return List<Map>.from(response.data['items']);
  }

  @override
  Future<List<Map>> getSimilarBooks(Book book,[int pageNumber = 0]) async {
    var response = await _dio.get("${_baseUrl}volumes?q=title:${book.title}&Filtering=free-ebooks&startIndex=${pageNumber*10}&Sorting=relevence");
    return List<Map>.from(response.data['items']);
  }
}