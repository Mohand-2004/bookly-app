import 'package:bookly/core/data/local/home_local_data_source.dart';
import 'package:bookly/core/database/database_init.dart';
import 'package:bookly/core/database/database_model.dart';
import 'package:bookly/core/models/book_model.dart';

class HomeLocalDataSourceSqfliteImplementation implements HomeLocalDataSource {
  final DataBase _dataBase = dataBaseInit();
  @override
  Future<void> cacheFeaturedBooks(List<Book> books) async {
    for (Book book in books){
      await _dataBase.voidQuery(
        """
        INSERT INTO featured_books Values(
          '${book.id}',
          '${book.title}',
          '${book.rating == 'No Rating' ? 0 : book.rating}',
          '${book.ratingCount}',
          '${book.imageUrl ?? ''}',
          '${book.downloadLink ?? ''}',
          '${book.previewLink ?? ''}'
        );
        """
      );

      for (String author in book.authorsNames){
        await _dataBase.voidQuery(
          """
          INSERT INTO featured_book_authers Values(
            '${book.id}',
            '$author'
          );
          """
        );
      }
    }
  }

  @override
  Future<void> deleteFeaturedBooksCache() async {
    await _dataBase.voidQuery(
      """
      DELETE FROM featured_book_authers;
      """
    );

    await _dataBase.voidQuery(
      """
      DELETE FROM featured_books;
      """
    );
  }

  @override
  Future<void> deleteNewestBooksCache() async {
    await _dataBase.voidQuery(
      """
      DELETE FROM newest_book_authers;
      """
    );

    await _dataBase.voidQuery(
      """
      DELETE FROM newest_books;
      """
    );
  }

  @override
  Future<List<Book>> getFeaturedBooks() async {
    var response = await _dataBase.returnQuery(
      """
      SELECT * FROM featured_books;
      """
    );

    List<Book> books = [];

    for (Map json in response){
      Map bookJson = {...json};
      var authers = await _dataBase.returnQuery(
        """
        SELECT auther_name FROM featured_book_authers WHERE id = '${json['id']}';
        """
      );
      bookJson['authors'] = authers.map((e) => e['auther_name'].toString()).toList();
      books.add(Book.fromLocalDataSource(bookJson,),);
    }
    return books;
  }

  @override
  Future<List<Book>> getNewestBooks() async {
    var response = await _dataBase.returnQuery(
      """
      SELECT * FROM newest_books;
      """
    );

    List<Book> books = [];

    for (Map json in response){
      Map bookJson = {...json};
      var authers = await _dataBase.returnQuery(
        """
        SELECT auther_name FROM newest_book_authers WHERE id = '${json['id']}';
        """
      );
      bookJson['authors'] = authers.map((e) => e['auther_name'].toString()).toList();
      books.add(Book.fromLocalDataSource(bookJson,),);
    }
    return books;
  }
  
  @override
  Future<void> cacheNewestBooks(List<Book> books) async {
    for (Book book in books){
      await _dataBase.voidQuery(
        """
        INSERT INTO newest_books Values(
          '${book.id}',
          '${book.title}',
          '${book.rating == 'No Rating' ? 0 : book.rating}',
          '${book.ratingCount}',
          '${book.imageUrl ?? ''}',
          '${book.downloadLink ?? ''}',
          '${book.previewLink ?? ''}'
        );
        """
      );

      for (String author in book.authorsNames){
        await _dataBase.voidQuery(
          """
          INSERT INTO newest_book_authers Values(
            '${book.id}',
            '$author'
          );
          """
        );
      }
    }
  }
}