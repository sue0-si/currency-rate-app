import 'package:currency_rate/ui/main_viewModel.dart';
import 'package:get_it/get_it.dart';

import '../data/repository/main_repository.dart';
import '../data/repository/main_repository_impl.dart';

final getIt  = GetIt.instance;

void diSetup(){
  getIt.registerSingleton<MainRepository>(MainRepositoryImpl());
  getIt.registerFactory<MainViewModel>(() => MainViewModel(repository: getIt<MainRepository>()));
}