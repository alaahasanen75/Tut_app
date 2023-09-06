import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
// import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(getit(), getit(), getit()),
        child: BlocConsumer<AppCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: [
                    ListTile(
                      title: Text(
                        'change_language'.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorManage.grey),
                      ),
                      leading: Icon(
                        Icons.language,
                        color: ColorManage.Primary,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: ColorManage.Primary,
                      ),
                      onTap: () {
                        AppCubit.get(context).changeAppLanguage();
                        Phoenix.rebirth(context);
                      },
                    ),
                    Container(
                      color: ColorManage.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                    ListTile(
                      title: Text(
                        'contact_us'.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorManage.grey),
                      ),
                      leading: Icon(
                        Icons.contact_emergency_outlined,
                        color: ColorManage.Primary,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: ColorManage.Primary,
                      ),
                      onTap: () {},
                    ),
                    Container(
                      color: ColorManage.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                    ListTile(
                      title: Text(
                        'invit_frindes'.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorManage.grey),
                      ),
                      leading: Icon(
                        Icons.share,
                        color: ColorManage.Primary,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: ColorManage.Primary,
                      ),
                      onTap: () {},
                    ),
                    Container(
                      color: ColorManage.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                    ListTile(
                      title: Text(
                        'logout'.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorManage.grey),
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: ColorManage.Primary,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: ColorManage.Primary,
                      ),
                      onTap: () {
                        CachHelper.removeData(key: 'Id').then((value) =>
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: ((context) {
                              return login();
                            })), (route) => false));
                      },
                    )
                  ]),
                ),
              );
            }));
  }
}
