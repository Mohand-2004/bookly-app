import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/domain/home_repo.dart';
import 'package:bookly/features/home/presentation/logic/home%20featured%20books%20cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeaturedBooksCubit extends Cubit<HomeFeaturedBooksState> {
  final HomeRepo _homeRepo;
  List<Book> _featuredBooks = [];

  HomeFeaturedBooksCubit(this._homeRepo,) : super(HomeFeaturedBooksInitial()){
    _getFeaturedBooks();
  }

  void _getFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await _homeRepo.getFeaturedBooks();
    result.fold(
      (failure){
        emit(FeaturedBooksErrorState(failure));
      },
      (books){
        _featuredBooks = books;
        emit(FeaturedBooksSuccessState());
      }
    );
  }

  List<Book> get featuredBooks => _featuredBooks;
}