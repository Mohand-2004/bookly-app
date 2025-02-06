import 'package:bookly/core/models/failure_model.dart';

abstract class HomeFeaturedBooksState{}

class HomeFeaturedBooksInitial extends HomeFeaturedBooksState{}

class FeaturedBooksLoadingState extends HomeFeaturedBooksState{}

class FeaturedBooksSuccessState extends HomeFeaturedBooksState{}

class PaginationErrorState extends HomeFeaturedBooksState{
  final Failure failure;
  PaginationErrorState(this.failure);
}

class FeaturedBooksErrorState extends HomeFeaturedBooksState{
  final Failure failure;
  FeaturedBooksErrorState(this.failure);
}