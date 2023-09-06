import 'package:flutter/material.dart';

abstract class LoginState {}

class Initialstate extends LoginState {}

class LoginLoadingState extends LoginState {}

class HomeLoadingState extends LoginState {}

class LoginSuccessfulState extends LoginState {}

class HomeSuccessfulState extends LoginState {}

class LoginErrorState extends LoginState {
  LoginErrorState();
}

class HomeErrorState extends LoginState {
  HomeErrorState();
}

class ResetLoadingState extends LoginState {}

class ChangelanState extends LoginState {
  ChangelanState();
}

class ResetSuccessfulState extends LoginState {}

class ResetErrorState extends LoginState {
  ResetErrorState();
}

class ChangeBottomNaveState extends LoginState {
  ChangeBottomNaveState();
}

class ChangeScreenState extends LoginState {
  ChangeScreenState();
}
