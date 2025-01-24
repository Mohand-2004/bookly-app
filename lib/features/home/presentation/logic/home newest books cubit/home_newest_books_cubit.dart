import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/home_repo.dart';
import 'package:bookly/features/home/presentation/logic/home%20newest%20books%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNewestBooksCubit extends Cubit<HomeNewestBooksState>{
  final HomeRepo _homeRepo;
  List<Book> _newestBooks = [];
  HomeNewestBooksCubit(this._homeRepo,) : super(NewsetBooksInitial()){
    _getNewestBooks();
  }

  void _getNewestBooks() async {
    emit(NewsetBooksLoadingState(),);
    var result = await _homeRepo.getNewestBooks();
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