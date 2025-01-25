import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/search/domain/search_repo.dart';
import 'package:bookly/features/search/presentation/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  List<Book> _books = [];
  SearchCubit(this._searchRepo,) : super(SearchInitial());

  Future<void> searchBooks(String searchText) async {
    emit(SearchLoading(),);
    var result = await _searchRepo.searchBooks(searchText,);
    result.fold(
      (faluire){
        emit(SearchError(faluire,),);
      },
      (books){
        _books = books;
        emit(SearchSucess(),);
      }
    );
  }

  List<Book> get books => _books;
}