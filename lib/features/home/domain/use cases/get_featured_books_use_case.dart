import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:bookly/core/models/general_use_case.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedBooksUseCase extends GeneralUseCase<Either<Failure,List<Book>>,void> {
  final HomeRepo _homeRepo;

  GetFeaturedBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure,List<Book>>> execute([void param]) async {
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

    if (books.isNotEmpty){
      return right(books,);
    }

    // get books from remote
    final remoteResult = await _homeRepo.getFeaturedBooks();
    remoteResult.fold(
      (failure){
        return left(failure,);
      },
      (remoteBooks) async {
        // cache books
        await _homeRepo.cacheFeaturedBooks(remoteBooks,);
      }
    );

    return remoteResult;
  }
}