import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/search/domain/search_repo.dart';
import 'package:bookly/features/search/presentation/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  final List<Book> _books = [];
  late ScrollController scrollController;
  int nextPageNumber = 1;
  bool isloading = false;
  SearchCubit(this._searchRepo,) : super(SearchInitial()){
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }
  void _scrollListener() async {
    if (scrollController.position.pixels >= 0.8 * scrollController.position.maxScrollExtent) {
      if (!isloading){
        isloading = true;
        await searchBooks(
          SearchRepo.searchValue,nextPageNumber++
        );
        isloading = false;
      }
    }
  }

  Future<void> searchBooks(String searchText,[int pageNumber = 0]) async {
    if(pageNumber == 0){
      nextPageNumber = 1;
      _books.clear();
      emit(SearchLoading(),);
    }
    var result = await _searchRepo.searchBooks(searchText,pageNumber);
    result.fold(
      (faluire){
        emit(SearchError(faluire,),);
      },
      (books){
        _books.addAll(books);
        emit(SearchSucess(),);
      }
    );
  }

  List<Book> get books => _books;
}