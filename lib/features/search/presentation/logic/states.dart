import 'package:bookly/core/models/failure_model.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}

class SearchLoading extends SearchState{}

class SearchSucess extends SearchState{}

class SearchError extends SearchState{
  final Failure failure;
  SearchError(this.failure);
}