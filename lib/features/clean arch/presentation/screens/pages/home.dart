import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/serves.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/clean_arch_cubit.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/cubit/state.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/details_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/fonts_manager.dart';
import '../../../../../core/string_manege.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, LoginState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
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
        } else if (state is HomeLoadingState) {
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
        }
      },
      builder: (context, state) {
        List<dynamic> model = AppCubit.get(context).model1!;

        return Scaffold(
            appBar: AppBar(title: Text('hallo')),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CarouselSlider(
                            items: model
                                .map((e) => SizedBox(
                                      width: double.infinity,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            side: BorderSide(
                                                color: ColorManage.Primary)),
                                        elevation: 4,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image(
                                            image:
                                                NetworkImage('${e['image']}'),
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                height: 90,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'services',
                          style: TextStyle(
                              color: ColorManage.Primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                            width: double.infinity,
                            height: 140,
                            margin: EdgeInsets.symmetric(vertical: 12),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: model
                                    .map(
                                      (e) => Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            side: BorderSide(
                                                color: ColorManage.Primary,
                                                width: 1)),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image(
                                                image: NetworkImage(
                                                    '${e['image']}'),
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'service',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: ColorManage.grey),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Flex(
                                              direction: Axis.vertical,
                                              children: [
                                                GridView.count(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 8,
                                                  mainAxisSpacing: 8,
                                                  physics: ScrollPhysics(),
                                                  shrinkWrap: true,
                                                  children:
                                                      List.generate(6, (index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    ((context) {
                                                          return DetailsView();
                                                        })));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        child: Image(
                                                          image: NetworkImage(
                                                              '${model[index]['image']}'
                                                              ''),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList())),
                      )
                    ])));
      },
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
}
