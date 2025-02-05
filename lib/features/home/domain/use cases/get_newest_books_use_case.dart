import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/models/failure_model.dart';
import 'package:bookly/core/models/general_use_case.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetNewestBooksUseCase extends GeneralUseCase<Either<Failure,List<Book>>,int> {
  final HomeRepo _homeRepo;
  static int nextPageNumber = 1;

  GetNewestBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure, List<Book>>> execute([int param = 0]) async {
    List<Book> books = [];
    // get books from cache
    final cacheResult = await _homeRepo.getCachedNewestBooks();
    cacheResult.fold(
      (failure){},
      (cachedBooks){
        if (cachedBooks.isNotEmpty){
          books = cachedBooks;
        }
      }
    );

    if (param == 0){
      GetNewestBooksUseCase.nextPageNumber = (books.length ~/ 10) + 1;
    }

    if (param != 0){
      param = GetNewestBooksUseCase.nextPageNumber;
    }

    if (books.isNotEmpty && param == 0){
      return right((param == 0 ? books : []),);
    }

    // get books from remote
    final remoteResult = await _homeRepo.getNewestBooks(param);
    remoteResult.fold(
      (failure){
        return left(failure,);
      },
      (remoteBooks) async {
        // cache books
        await _homeRepo.cacheNewestBooks(remoteBooks,);
        if(param != 0) GetNewestBooksUseCase.nextPageNumber++;
      }
    );

    return remoteResult;
  }
}