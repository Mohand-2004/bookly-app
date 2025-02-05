abstract class SearchRemoteDataSource {
  Future<List<Map>> searchBooks(String searchText,[int pageNumber = 0]);
}