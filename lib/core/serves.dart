import 'package:flutter_application_1/features/clean%20arch/data/models/login_model.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/home.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/reset.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:get_it/get_it.dart';

import '../features/clean arch/data/datasources/remote_data_sourse.dart';
import '../features/clean arch/data/repositories/repo.dart';
import '../features/clean arch/domain/repositories/base_repo.dart';
import '../features/clean arch/domain/usecases/login.dart';

final GetIt getit = GetIt.instance;

class Services {
  void init() {
    // getit.registerLazySingleton(() => GetPopularUseCase(getit()));
    // getit.registerLazySingleton(() => RecommendationUseCase(getit()));
    // getit.registerLazySingleton(() => GetRateUseCase(getit()));
    // getit.registerLazySingleton(() => GetDetailsUseCase(getit()));
    getit.registerLazySingleton(() => LoginUseCase(getit()));
    getit.registerLazySingleton(() => HomeUseCase(getit()));
    getit.registerLazySingleton(() => ResetUseCase(getit()));
    getit.registerLazySingleton(() => AppCubit(getit(), getit(), getit()));
    getit.registerLazySingleton<BaseRepo>(() => Repo(getit()));
    getit.registerLazySingleton<BaseRemoteDatasource>(
        () => LoginRemoteDatasource());
  }
}
