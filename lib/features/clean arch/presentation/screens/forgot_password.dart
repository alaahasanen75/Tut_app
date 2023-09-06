import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/values_managers.dart';
// import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/main_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/regester_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  Future pickImageGallery() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    Navigator.pop(context);
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  Future pickImageCamera() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    Navigator.pop(context);
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  var formkey = GlobalKey<FormState>();
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController phonecontroller;
  late TextEditingController usercontroller;
  late TextEditingController profilecontroller;
  final picker = ImagePicker();
  File? image;
  String? text;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  bool Active = false;
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    usercontroller = TextEditingController();
    profilecontroller = TextEditingController();
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
                  MaterialPageRoute(builder: ((context) => MainView())),
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
                                        errorText: emailcontroller
                                                    .text.length >=
                                                4
                                            ? text = null
                                            : text =
                                                'email should be at least 8 chars',
                                        hintText: 'email',
                                        labelText: 'email'),
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
                                      errorText: passwordcontroller
                                                  .text.length >=
                                              4
                                          ? text2 = null
                                          : text2 =
                                              'password should be at least 8 chars',
                                      hintText: 'password',
                                      labelText: 'password',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'password is to short ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  )),
                              SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: Row(
                                    children: [
                                      // const Expanded(
                                      //     flex: 1,
                                      //     child: CountryCodePicker(
                                      //       onChanged: print,
                                      //       initialSelection: '+20',
                                      //       favorite: ['+39', 'FR'],
                                      //       showCountryOnly: true,
                                      //       hideMainText: true,
                                      //     )),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: phonecontroller,
                                          decoration: InputDecoration(
                                            errorText: phonecontroller
                                                        .text.length >=
                                                    4
                                                ? text = null
                                                : text =
                                                    'phone should be at least 8 chars',
                                            hintText: 'phone Number',
                                            labelText: 'phone Number',
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'phone Number is to short ';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: usercontroller,
                                    decoration: InputDecoration(
                                      errorText: usercontroller.text.length >= 4
                                          ? text3 = null
                                          : text3 =
                                              'user name should be at least 8 chars',
                                      hintText: 'user name',
                                      labelText: 'user name',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'user name is to short ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  )),
                              SizedBox(
                                height: AppSize.s28,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: Container(
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return SafeArea(
                                                  child: Wrap(
                                                children: [
                                                  ListTile(
                                                    onTap: () {
                                                      pickImageCamera();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    trailing: Icon(
                                                        Icons.arrow_forward),
                                                    leading: Icon(Icons.camera),
                                                    title: Text(
                                                        'photo from camera'),
                                                  ),
                                                  ListTile(
                                                    onTap: () {
                                                      pickImageGallery();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    trailing: Icon(
                                                        Icons.arrow_forward),
                                                    leading: Icon(
                                                        Icons.browse_gallery),
                                                    title: Text(
                                                        'photo from gallery'),
                                                  )
                                                ],
                                              ));
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Profile picture',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            image != null
                                                ? CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: FileImage(
                                                      File(image!.path),
                                                    ),
                                                  )
                                                : Container(),
                                            const Icon(
                                              Icons.camera_alt,
                                              color: Colors.grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1.5,
                                            color: ColorManage.grey)),
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
                                        child: Text('REGESTER')),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppPadding.p8,
                                      left: AppPadding.p28,
                                      right: AppPadding.p28),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return login();
                                            })));
                                          },
                                          child: Text(
                                              'Aready have acount? login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                        ),
                                      ],
                                    ),
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
