import 'package:bookly/core/DI/main_di.dart';
import 'package:bookly/core/data/home_data_source.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepo(this._homeDataSource);

  Future<Either<Failure,List<Book>>> getNewestBooks() async {
    try{
      var response = await _homeDataSource.getNewestBooks();
      List<Book> newestBooks = [];
      for (Map json in response){
        newestBooks.add(Book.fromJson(json,),);
      }
      return right(newestBooks);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  Future<Either<Failure,List<Book>>> getFeaturedBooks() async {
    try{
      var response = await _homeDataSource.getFeaturedBooks();
      List<Book> featuredBooks = [];
      for (Map json in response){
        featuredBooks.add(Book.fromJson(json,),);
      }
      return right(featuredBooks);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  static Future<List<Book>> getSimilarBooks(Book book) async {
    final HomeDataSource homeDataSource = getIt();
    List<Book> books = [];
    var response = await homeDataSource.getSimilarBooks(book,);
    for (Map json in response){
      books.add(Book.fromJson(json,),);
    }
    return books;
  }
}