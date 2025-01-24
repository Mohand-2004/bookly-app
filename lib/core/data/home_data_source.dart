abstract class HomeDataSource {
  Future<List<Map>> getFeaturedBooks();

  Future<List<Map>> getNewestBooks();
}