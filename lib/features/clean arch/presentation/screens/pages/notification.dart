import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/thems_manager.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void didChangeDependencies() {
    CachHelper.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => AppCubit(getit(), getit(), getit())
          ..Home()
          ..Details()),
        child: BlocConsumer<AppCubit, LoginState>(
          builder: (context, state) {
            return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: AppCubit.get(context).changeApp(),
                //  badge,
                debugShowCheckedModeBanner: false,
                theme: getApplicationTheme());
          },
          listener: (BuildContext context, LoginState state) {},
        ));
  }
}
