import 'package:bookly/core/data/home_data_source.dart';
import 'package:bookly/features/home/data/google_api_home_data_sourec_implementation.dart';
import 'package:bookly/features/home/domain/home_repo.dart';
import 'package:get_it/get_it.dart';

part 'home_di.dart';

final getIt = GetIt.instance;

void initDI(){
  _homeDataSourceDi();
}