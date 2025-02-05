part of 'main_di.dart';

void _searchDataSourceDi(){
  getIt.registerLazySingleton<SearchRemoteDataSource>(() => SearchDataSourecGoogleApiImplementation());
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt(),));
}