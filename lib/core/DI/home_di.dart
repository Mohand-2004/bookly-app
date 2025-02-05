part of 'main_di.dart';


void _homeDataSourceDi(){
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => GoogleApiHomeDataSourecImplementation());
  getIt.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceSqfliteImplementation());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt(),getIt()));
  getIt.registerLazySingleton<GetFeaturedBooksUseCase>(() => GetFeaturedBooksUseCase(getIt(),));
  getIt.registerLazySingleton<GetNewestBooksUseCase>(() => GetNewestBooksUseCase(getIt(),));
}