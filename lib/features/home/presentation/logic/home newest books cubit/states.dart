import 'package:bookly/core/models/failure_model.dart';

abstract class HomeNewestBooksState{}

class NewsetBooksInitial extends HomeNewestBooksState{}

class NewsetBooksLoadingState extends HomeNewestBooksState{}

class NewsetBooksSuccessState extends HomeNewestBooksState{}

class NewsetBooksErrorState extends HomeNewestBooksState{
  final Failure failure;
  NewsetBooksErrorState(this.failure);
}

class PaginationErrorState extends HomeNewestBooksState{
  final Failure failure;
  PaginationErrorState(this.failure);
}