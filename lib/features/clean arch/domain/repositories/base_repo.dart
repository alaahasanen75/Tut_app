import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/features/clean%20arch/data/models/login_model.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/utils/fauir.dart';

import '../../presentation/screens/pages/home_model.dart';

abstract class BaseRepo {
  Future<Either<Failure, Response<dynamic>>> Login(
    Inputt inputt,
  );
  Future<Either<Failure, Map<String, dynamic>>> Home();
  Future<Either<Failure, Response<dynamic>>> Reset(
    Inputt inputt,
  );
  Future<Either<Failure, Response<dynamic>>> Regester(
    Inputt inputt,
  );
}
