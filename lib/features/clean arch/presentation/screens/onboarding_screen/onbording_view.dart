import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/onboarding_screen/onboardin_models.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/login_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _BoardingState();
}

class _BoardingState extends State<onboardingScreen> {
  @override
  Widget build(BuildContext context) {
    bool? islast;
    int currentindex = 0;

    List<Boarder> board = [
      Boarder(
          body: AppString.onBordingTitile1,
          title: AppString.onBordingSubTitile1,
          image: ImageAssets.onbordinglogo),
      Boarder(
          body: AppString.onBordingTitile1,
          title: AppString.onBordingSubTitile1,
          image: ImageAssets.onbordinglogo),
      Boarder(
          body: AppString.onBordingTitile1,
          title: AppString.onBordingSubTitile1,
          image: ImageAssets.onbordinglogo)
    ];
    void submit() {
      CachHelper.SaveData(value: true, key: 'onBording').then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => login())),
            (route) => false);
      });
    }

    var boardcontroller = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManage.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManage.white,
            statusBarBrightness: Brightness.dark),
        actions: [
          TextButton(
            child: Text(
              AppString.skip,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.end,
            ),
            onPressed: () {
              submit();
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return login();
              })));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p30),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) {
                print(value);
                if (value == board.length - 1) {
                  currentindex = value;
                  setState(
                    () {
                      islast = true;
                      print('$islast');
                    },
                  );
                } else {
                  print('Notlast');
                  setState(
                    () {
                      islast = false;
                      currentindex = value;
                    },
                  );
                }
              },
              physics: BouncingScrollPhysics(),
              controller: boardcontroller,
              itemBuilder: ((context, index) => OnBoard(board[index], context)),
              itemCount: board.length,
            )),
            SizedBox(
              height: AppSize.s45,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardcontroller,
                  count: board.length,
                  effect: ExpandingDotsEffect(
                      dotColor: ColorManage.grey,
                      dotHeight: 10,
                      activeDotColor: ColorManage.Primary,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: ColorManage.Primary,
                  onPressed: () {
                    if (islast == true) {
                      submit();
                      print('hhhhhhh');
                    } else {
                      boardcontroller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget OnBoard(Boarder moudel, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset('${moudel.image}')),
        SizedBox(
          height: 15,
        ),
        Text(
          '${moudel.title}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${moudel.body}',
          style: Theme.of(context).textTheme.displayLarge,
        )
      ],
    );
