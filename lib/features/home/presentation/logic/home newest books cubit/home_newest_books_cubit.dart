import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/use%20cases/get_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNewestBooksCubit extends Cubit<HomeNewestBooksState>{
  final GetNewestBooksUseCase _useCase;
  List<Book> _newestBooks = [];
  HomeNewestBooksCubit(this._useCase,) : super(NewsetBooksInitial()){
    getNewestBooks();
  }

  void getNewestBooks([int pageNumber = 0]) async {
    emit(NewsetBooksLoadingState(),);
    var result = await _useCase.execute(pageNumber);
    result.fold(
      (failure){
        emit(NewsetBooksErrorState(failure,),);
      },
      (books){
        _newestBooks = books;
        emit(NewsetBooksSuccessState(),);
      }
    );
  }

  List<Book> get newestBooks => _newestBooks;
}