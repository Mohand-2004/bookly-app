part of 'main_di.dart';

void _searchDataSourceDi(){
  getIt.registerLazySingleton<SearchDataSource>(() => SearchDataSourecGoogleApiImplementation());
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt(),));
}