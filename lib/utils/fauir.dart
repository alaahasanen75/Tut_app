import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String code;
  String msg;
  Failure(
    this.code,
    this.msg,
  );
  List<Object?> get props => [msg];
}

class ServerFailure extends Failure {
  ServerFailure(super.msg, super.code);
}

class DbFailure extends Failure {
  DbFailure(super.msg, super.code);
}
