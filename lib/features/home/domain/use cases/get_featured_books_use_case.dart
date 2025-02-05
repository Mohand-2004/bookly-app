import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:bookly/core/models/general_use_case.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedBooksUseCase extends GeneralUseCase<Either<Failure,List<Book>>,int> {
  final HomeRepo _homeRepo;
    static int nextPageNumber = 1;

  GetFeaturedBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure,List<Book>>> execute([int param = 0]) async {
    List<Book> books = [];
    // get books from cache
    final cacheResult = await _homeRepo.getCachedFeaturedBooks();
    cacheResult.fold(
      (failure){},
      (cachedBooks){
        if (cachedBooks.isNotEmpty){
          books = cachedBooks;
        }
      }
    );

    if (param == 0){
      GetFeaturedBooksUseCase.nextPageNumber = (books.length ~/ 10) + 1;
    }

    if (books.isNotEmpty && param < GetFeaturedBooksUseCase.nextPageNumber){
      return right((param == 0 ? books : []),);
    }

    // get books from remote
    final remoteResult = await _homeRepo.getFeaturedBooks(param);
    remoteResult.fold(
      (failure){
        return left(failure,);
      },
      (remoteBooks) async {
        // cache books
        await _homeRepo.cacheFeaturedBooks(remoteBooks,);
        if(param != 0) GetFeaturedBooksUseCase.nextPageNumber++;
      }
    );

    return remoteResult;
  }
}