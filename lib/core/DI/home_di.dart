part of 'main_di.dart';


void _homeDataSourceDi(){
  getIt.registerLazySingleton<HomeDataSource>(() => GoogleApiHomeDataSourecImplementation());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt(),));
}