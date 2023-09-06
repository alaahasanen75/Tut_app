import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/features/clean%20arch/data/models/login_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/forgot_password.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/main.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/regester_screen.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var formkey = GlobalKey<FormState>();
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;

  SuccessfullLoginModel? _successfullLoginModel;
  bool Active = false;
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    emailcontroller.addListener(() {
      final Active =
          emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty;
      setState(() => this.Active = Active);
    });
    passwordcontroller.addListener(() {
      final Active =
          emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty;
      setState(() => this.Active = Active);
    });
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(getit(), getit(), getit()),
        child: BlocConsumer<AppCubit, LoginState>(listener: (context, state) {
          if (state is LoginSuccessfulState) {
            CachHelper.SaveData(value: true, key: 'token').then((value) {
              AppString.token = true;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => RegesterView())),
                  (route) => false);
            });
          }

          if (state is LoginLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                        // abc@gmail.com
                        height: 100,
                        width: 120,
                        decoration: BoxDecoration(
                            color: ColorManage.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(AppSize.s14),
                            boxShadow: [BoxShadow(color: Colors.black26)]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: AppSize.s100,
                              width: AppSize.s100,
                              child: Lottie.asset(
                                "json/loading.json",
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        )),
                  );
                });

            print('ahhooooo');
          } else if (state is LoginErrorState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Container(
                          // abc@gmail.com
                          height: 250,
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorManage.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(AppSize.s14),
                              boxShadow: [BoxShadow(color: Colors.black26)]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppSize.s100,
                                width: AppSize.s100,
                                child: Lottie.asset(
                                  "json/error.json",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s4,
                              ),
                              GetMassage('Not Found'),
                              GetRetryButton(AppString.Ok, context)
                            ],
                          )

                          // GetAnimatedImage("assets/json/error.json"),
                          // GetMassage('Not Found'),
                          // GetRetryButton(AppString.Ok, context)

                          ));
                });
          }

          if (state is LoginSuccessfulState) {
            CachHelper.SaveData(value: 'Id', key: 'Id').then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => MainScreen())),
                  (route) => false);
            });
          }
        }, builder: (context, state) {
          return Scaffold(
              backgroundColor: ColorManage.white,
              body: Container(
                  padding: const EdgeInsets.only(top: AppPadding.p1100),
                  child: SingleChildScrollView(
                      child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Center(
                                  child: Image.asset("imeges/splash_logo.png")),
                              SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p28,
                                    right: AppPadding.p28),
                                child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                        hintText: 'email',
                                        labelText: "email".tr()),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email must not be empty ';
                                      }
                                      return null;
                                    }),
                              ),
                              SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordcontroller,
                                    decoration: InputDecoration(
                                      hintText: "password".tr(),
                                      labelText: 'password'.tr(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is to short ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  )),
                              const SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: AppSize.s40,
                                    child: ElevatedButton(
                                        onPressed: (Active)
                                            ? () {
                                                setState(() {
                                                  Active = false;
                                                });
                                                if (formkey.currentState!
                                                    .validate()) {
                                                  AppCubit.get(context).Login({
                                                    "email":
                                                        emailcontroller.text,
                                                    "password":
                                                        passwordcontroller.text
                                                  });
                                                }
                                              }
                                            : null,
                                        child: Text('login'.tr())),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppPadding.p8,
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) {
                                            return ForgotView();
                                          })));
                                        },
                                        child: Text('not_amember'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return MainScreen();
                                            })));
                                          },
                                          child: Text("for_get_password".tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium))
                                    ],
                                  )),
                            ],
                          )))));
        }));
  }

  Widget GetDialog(context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManage.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: [BoxShadow(color: Colors.black26)]),
        child: GetDialogContent(context, children),
      ),
    );
  }

  Widget GetDialogContent(context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget GetMassage(String massage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          massage,
          style: TextStyle(
              color: ColorManage.black,
              fontSize: FontSize.s18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget GetAnimatedImage(String name) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(name),
    );
  }

  Widget GetRetryButton(String buttonTittle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: ((context) => login())),
                      (route) => false);
                },
                child: Text(buttonTittle))),
      ),
    );
  }
}
