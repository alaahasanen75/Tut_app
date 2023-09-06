import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'core/langauge_manager.dart';
import 'core/network/bloc_observe.dart';

Future<void> main() async {
  // Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();

  DioHelper.init();
  Services().init();

  await CachHelper.init();

  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp())));
}



  // Widget badge = Splash();
  // void initstate() {

  //   super.initState();
  //   Timer(const Duration(seconds: 3), () {
  //     setState(() {
  //       badge = onboardingScreen();
  //     });
  //   });
  // }