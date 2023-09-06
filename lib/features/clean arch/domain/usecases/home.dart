import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/base_usecase.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home_model.dart';
import 'package:flutter_application_1/utils/fauir.dart';

import '../repositories/base_repo.dart';

class HomeUseCase {
  BaseRepo baseRepo;
  HomeUseCase(this.baseRepo);
  @override
  Future<Either<Failure, Map<String, dynamic>>> excute() {
    return baseRepo.Home();
  }
}
