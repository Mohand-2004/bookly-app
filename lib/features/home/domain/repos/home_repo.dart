import 'package:bookly/core/DI/main_di.dart';
import 'package:bookly/core/data/local/home_local_data_source.dart';
import 'package:bookly/core/data/remote/home_remote_data_source.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  final HomeRemoteDataSource _homeDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepo(this._homeDataSource,this._homeLocalDataSource,);

  Future<Either<Failure,List<Book>>> getNewestBooks([int pageNumber = 0]) async {
    try{
      var response = await _homeDataSource.getNewestBooks(pageNumber);
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

  Future<Either<Failure,List<Book>>> getFeaturedBooks([int pageNumber = 0]) async {
    try{
      var response = await _homeDataSource.getFeaturedBooks(pageNumber,);
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

  Future<Either<Failure,void>> cacheFeaturedBooks(List<Book> books) async {
    try{
      await _homeLocalDataSource.cacheFeaturedBooks(books,);
      return right(null,);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  Future<Either<Failure,void>> cacheNewestBooks(List<Book> books) async {
    try{
      await _homeLocalDataSource.cacheNewestBooks(books,);
      return right(null,);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  Future<Either<Failure,List<Book>>> getCachedFeaturedBooks() async {
    try{
      final books = await _homeLocalDataSource.getFeaturedBooks();
      return right(books,);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  Future<Either<Failure,List<Book>>> getCachedNewestBooks() async {
    // try{
      final books = await _homeLocalDataSource.getNewestBooks();
      return right(books,);
    // }
    // catch (e){
    //   return left(Failure(e.toString(),),);
    // }
  }

  Future<Either<Failure,void>> deleteFeaturedBooksCache() async {
    try{
      await _homeLocalDataSource.deleteFeaturedBooksCache();
      return right(null,);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  Future<Either<Failure,void>> deleteNewestBooksCache() async {
    try{
      await _homeLocalDataSource.deleteNewestBooksCache();
      return right(null,);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }

  static Future<List<Book>> getSimilarBooks(Book book,[int pageNumber = 0]) async {
    final HomeRemoteDataSource homeDataSource = getIt();
    List<Book> books = [];
    var response = await homeDataSource.getSimilarBooks(book,pageNumber,);
    for (Map json in response){
      books.add(Book.fromJson(json,),);
    }
    return books;
  }
}