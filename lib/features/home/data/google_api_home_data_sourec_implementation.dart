import 'package:bookly/core/data/home_data_source.dart';
import 'package:dio/dio.dart';

class GoogleApiHomeDataSourecImplementation implements HomeDataSource {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();

  @override
  Future<List<Map>> getNewestBooks() async {
    var response = await _dio.get("${_baseUrl}volumes?q=subjet:Programming&Filtering=free-ebooks&Sorting=newest");
    return List<Map>.from(response.data['items']);
  }

  @override
  Future<List<Map>> getFeaturedBooks() async {
    var response = await _dio.get("${_baseUrl}volumes?q=subjet:Programming&Filtering=free-ebooks");
    return List<Map>.from(response.data['items']);
  }
}