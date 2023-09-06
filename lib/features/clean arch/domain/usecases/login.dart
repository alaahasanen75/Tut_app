import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/base_usecase.dart';
import 'package:flutter_application_1/utils/fauir.dart';

import '../repositories/base_repo.dart';

class LoginUseCase extends BaseUseCase<Inputt, Response<dynamic>> {
  BaseRepo baseRepo;
  LoginUseCase(this.baseRepo);
  @override
  Future<Either<Failure, Response<dynamic>>> excute(
    Inputt Input,
  ) {
    return baseRepo.Login(Input);
  }
}

class Inputt {
  Map<String, String> data;
  Inputt(this.data);
}
