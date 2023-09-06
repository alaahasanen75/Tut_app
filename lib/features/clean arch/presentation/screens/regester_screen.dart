import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/path.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/features/clean%20arch/data/models/login_model.dart';

import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RegesterView extends StatefulWidget {
  const RegesterView({super.key});

  @override
  State<RegesterView> createState() => _RegesterViewState();
}

class _RegesterViewState extends State<RegesterView> {
  @override
  var formkey = GlobalKey<FormState>();
  late TextEditingController emailcontroller;

  bool Active = false;
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    emailcontroller.addListener(() {
      final Active = emailcontroller.text.isNotEmpty;
      setState(() => this.Active = Active);
    });
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(getit(), getit(), getit()),
        child: BlocConsumer<AppCubit, LoginState>(listener: (context, state) {
          if (state is ResetSuccessfulState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Container(
                          // abc@gmail.com
                          height: 320,
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
                                  "json/success.json",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s4,
                              ),
                              GetMassage('Success 😊'),
                              SizedBox(
                                height: 3,
                              ),
                              GetMassage(
                                  "we have send massage to your email abc@gmail.com"),
                              GetRetryButton(AppString.Ok, context)
                            ],
                          )));
                });
          }

          if (state is ResetLoadingState) {
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
          } else if (state is ResetErrorState) {
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
                          )));
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
                              const Center(
                                  child: Image(
                                      image:
                                          AssetImage(ImageAssets.splashLogo))),
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
                                        hintText: 'email', labelText: 'email'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email must not be empty ';
                                      }
                                      return null;
                                    }),
                              ),
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
                                                  // DioHelper
                                                  //     .postForgetPassword();
                                                  AppCubit.get(context).Reset();
                                                }
                                              }
                                            : null,
                                        child: Text('Reset_Password'.tr())),
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
              fontSize: FontSize.s16,
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
