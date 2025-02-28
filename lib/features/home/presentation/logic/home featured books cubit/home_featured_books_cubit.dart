import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/use%20cases/get_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeaturedBooksCubit extends Cubit<HomeFeaturedBooksState> {
  final GetFeaturedBooksUseCase _booksUseCase;
  final List<Book> _featuredBooks = [];

  HomeFeaturedBooksCubit(this._booksUseCase,) : super(HomeFeaturedBooksInitial()){
    getFeaturedBooks();
  }

  Future<void> getFeaturedBooks([int pageNumber = 0]) async {
    if (pageNumber == 0) emit(FeaturedBooksLoadingState());
    var result = await _booksUseCase.execute(pageNumber);
    result.fold(
      (failure){
        pageNumber == 0 ? emit(FeaturedBooksErrorState(failure)) : emit(PaginationErrorState(failure));
      },
      (books){
        _featuredBooks.addAll(books);
        emit(FeaturedBooksSuccessState());
      }
    );
  }

  List<Book> get featuredBooks => _featuredBooks;
}