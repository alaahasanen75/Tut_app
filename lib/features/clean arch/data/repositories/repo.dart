import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/exception.dart';
import 'package:flutter_application_1/features/clean%20arch/data/datasources/remote_data_sourse.dart';
import 'package:flutter_application_1/features/clean%20arch/data/models/login_model.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/repositories/base_repo.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home_model.dart';
import 'package:flutter_application_1/utils/fauir.dart';

class Repo implements BaseRepo {
  BaseRemoteDatasource baseRemoteDatasource;
  Repo(this.baseRemoteDatasource);

  @override
  Future<Either<Failure, Response<dynamic>>> Login(
    Inputt inputt,
  ) async {
    final result = await baseRemoteDatasource.Login(inputt);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.error.statuseCode,
        e.error.statuseMassage,
      ));
    }
  }

  Future<Either<Failure, Response<dynamic>>> Reset(
    Inputt inputt,
  ) async {
    final result = await baseRemoteDatasource.Login(inputt);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.error.statuseCode,
        e.error.statuseMassage,
      ));
    }
  }

  Future<Either<Failure, Response<dynamic>>> Regester(
    Inputt inputt,
  ) async {
    final result = await baseRemoteDatasource.Regester(inputt);

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.error.statuseCode,
        e.error.statuseMassage,
      ));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> Home() async {
    final result = await baseRemoteDatasource.Home();

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.error.statuseCode,
        e.error.statuseMassage,
      ));
    }
  }
}
