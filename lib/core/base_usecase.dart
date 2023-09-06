import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/utils/fauir.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> excute(In input);
}
