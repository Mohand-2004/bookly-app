import 'package:bookly/core/data/remote/search_remote_data_source.dart';
import 'package:dio/dio.dart';

class SearchDataSourecGoogleApiImplementation implements SearchRemoteDataSource{
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();
  @override
  Future<List<Map>> searchBooks(String searchText,[int pageNumber = 0]) async {
    final respone = await _dio.get("${_baseUrl}volumes?q=subject:$searchText&Filtering=free-ebooks&startIndex=${pageNumber*10}&Sorting=relevance");
    return List<Map>.from(respone.data['items'],);
  }
}