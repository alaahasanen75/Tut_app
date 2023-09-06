import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: ColorManage.lightGray, spreadRadius: 1)
                ]),
                child: BottomNavigationBar(
                  items: cubit.BottomItem,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottonNav(index);
                  },
                )));
      },
    );
  }
}
