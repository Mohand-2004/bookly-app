import 'package:bookly/core/data/local/home_local_data_source.dart';
import 'package:bookly/core/data/remote/home_remote_data_source.dart';
import 'package:bookly/core/data/remote/search_remote_data_source.dart';
import 'package:bookly/features/home/data/local/home_local_data_source_sqflite_implementation.dart';
import 'package:bookly/features/home/data/remote/google_api_home_remote_data_sourec_implementation.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/use%20cases/get_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use%20cases/get_newest_books_use_case.dart';
import 'package:bookly/features/search/data/search_data_source_google_api_implementation.dart';
import 'package:bookly/features/search/domain/search_repo.dart';
import 'package:get_it/get_it.dart';

part 'home_di.dart';
part 'search_di.dart';

final getIt = GetIt.instance;

void initDI(){
  _homeDataSourceDi();
  _searchDataSourceDi();
}