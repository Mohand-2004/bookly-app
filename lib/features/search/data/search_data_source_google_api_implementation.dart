import 'package:bookly/core/data/search_data_source.dart';
import 'package:dio/dio.dart';

class SearchDataSourecGoogleApiImplementation implements SearchDataSource{
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();
  @override
  Future<List<Map>> searchBooks(String searchText) async {
    final respone = await _dio.get("${_baseUrl}volumes?q=title:$searchText&Filtering=free-ebooks&Sorting=relevance");
    return List<Map>.from(respone.data['items'],);
  }
}