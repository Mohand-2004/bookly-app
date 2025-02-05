import 'package:bookly/core/data/remote/search_remote_data_source.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:dartz/dartz.dart';

class SearchRepo{
  final SearchRemoteDataSource _searchDataSource;
  static String searchValue = '';

  SearchRepo(this._searchDataSource);

  Future<Either<Failure,List<Book>>> searchBooks(String searchText,[int pageNumber = 0]) async {
    try{
      var response = await _searchDataSource.searchBooks(searchText,pageNumber,);
      List<Book> books = [];
      for (Map json in response){
        books.add(Book.fromJson(json,),);
      }
      return right(books);
    }
    catch (e){
      return left(Failure(e.toString(),),);
    }
  }
}