import 'package:bookly/core/data/home_data_source.dart';
import 'package:bookly/core/data/search_data_source.dart';
import 'package:bookly/features/home/data/google_api_home_data_sourec_implementation.dart';
import 'package:bookly/features/home/domain/home_repo.dart';
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