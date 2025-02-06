import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/use%20cases/get_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNewestBooksCubit extends Cubit<HomeNewestBooksState>{
  final GetNewestBooksUseCase _useCase;
  final List<Book> _newestBooks = [];
  HomeNewestBooksCubit(this._useCase,) : super(NewsetBooksInitial()){
    getNewestBooks();
  }

  Future<void> getNewestBooks([int pageNumber = 0]) async {
    if(pageNumber == 0) emit(NewsetBooksLoadingState(),);
    var result = await _useCase.execute(pageNumber);
    result.fold(
      (failure){
        pageNumber == 0 ? emit(NewsetBooksErrorState(failure,),) : emit(PaginationErrorState(failure,));
      },
      (books){
        _newestBooks.addAll(books,);
        emit(NewsetBooksSuccessState(),);
      }
    );
  }

  List<Book> get newestBooks => _newestBooks;
}