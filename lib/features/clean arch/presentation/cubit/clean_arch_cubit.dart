// import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/langauge_manager.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/home.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/reset.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/main_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/main_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/notification.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/search.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/setting.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/pages/home_model.dart';

class AppCubit extends Cubit<LoginState> {
  LoginUseCase _loginusecase;
  ResetUseCase _resetUseCase;
  HomeUseCase _homeUseCase;

  AppCubit(
    this._homeUseCase,
    this._resetUseCase,
    this._loginusecase,
  ) : super(Initialstate());
  static AppCubit get(context) => BlocProvider.of(context);
  var _successfullLoginModel;
  var reset;
  Locale? locale = Locale('en');
  Map<String, dynamic>? details;
  List<dynamic>? model1;
  List<dynamic>? model2;
  List<dynamic>? model3;
  void Login(Map<String, String> data) async {
    emit(LoginLoadingState());
    Inputt inputt = Inputt(data);
    await _loginusecase.excute(inputt).then((value) {
      _successfullLoginModel = value;
      emit(LoginSuccessfulState());
    }).catchError((error) {
      print('${error}vvvvvvv');
      emit(LoginErrorState());
    });
  }

  void Home() async {
    emit(HomeLoadingState());

    await DioHelper.Gethome().then((value) {
      model1 = DioHelper.model1!;
      model2 = DioHelper.model2!;
      model3 = DioHelper.model3!;
      emit(HomeSuccessfulState());
    }).catchError((error) {
      emit(HomeErrorState());
    });
  }

  void Details() async {
    emit(HomeLoadingState());

    await DioHelper.Getdetails().then((value) {
      details = DioHelper.details;
      print("${DioHelper.details} detaillllllllll");
      emit(HomeSuccessfulState());
    }).catchError((error) {
      print('${error}}اهوووو');
      emit(HomeErrorState());
    });
  }

  void Reset() async {
    emit(ResetLoadingState());

    await DioHelper.postForgetPassword().then((value) {
      reset = value;
      print('${value}اهووووو');

      emit(ResetSuccessfulState());
    }).catchError((error) {
      print('${error}vvvvvvv');
      emit(ResetErrorState());
    });
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.notification_add_outlined), label: 'notifications'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
  ];
  List<Widget> screens = [
    MainView(),
    ScreenNotification(),
    SearchScreen(),
    SettingScreen(),
  ];

  void changeBottonNav(int index) {
    currentIndex = index;

    emit(ChangeBottomNaveState());
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await CachHelper.getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      CachHelper.SaveData(value: LanguageType.ENGLISH.getValue(), key: 'lang');
    } else {
      // set arabic
      CachHelper.SaveData(value: LanguageType.ARABIC.getValue(), key: 'lang');
    }
  }

  Widget? changeApp() {
    Widget widget;

    bool? onbording = CachHelper.getData(
      key: 'onBording',
    );
    AppString.token = CachHelper.getData(
      key: 'Id',
    );
    if (onbording != null) {
      if (AppString.token != null) {
        widget = const MainView();
      } else {
        widget = login();
      }
    } else {
      widget = Splash();
    }

    emit(ChangeScreenState());
    return widget;
  }
}
