import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/base_usecase.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/utils/fauir.dart';

import '../repositories/base_repo.dart';

class RegesterUseCase extends BaseUseCase<Inputt, Response<dynamic>> {
  BaseRepo baseRepo;
  RegesterUseCase(this.baseRepo);
  @override
  Future<Either<Failure, Response<dynamic>>> excute(
    Inputt Input,
  ) {
    return baseRepo.Regester(Input);
  }
}
