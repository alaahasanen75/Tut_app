import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';
import 'package:flutter_application_1/core/string_manege.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:lottie/lottie.dart';

enum StateRandererType {
  popupLoadingState,
  popupErorrState,
  ContentState,

  popupEmptyState,
  fullScreenErorrState,
  fullScreenLoadingState,
}

class StateRanderer extends StatelessWidget {
  String? massage;
  String? tittle;
  StateRandererType? stateRandererType;
  Function? retryActionFunction;
  StateRanderer({
    required this.stateRandererType,
    this.massage = 'Loading....',
    required this.retryActionFunction,
    this.tittle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget GetStateWidget(context) {
    switch (stateRandererType) {
      case StateRandererType.fullScreenLoadingState:
        return GetItemsWidget([
          GetAnimatedImage("assets/json/loading.json"),
          GetMassage(massage!)
        ]);

      case StateRandererType.fullScreenErorrState:
        return GetItemsWidget([
          GetAnimatedImage("assets/json/error.json"),
          GetMassage(massage!),
          GetRetryButton(AppString.tryAgain, context)
        ]);
      case StateRandererType.popupLoadingState:
        return GetDialog(
            context, [GetAnimatedImage("assets/json/loading.json")]);

      case StateRandererType.popupErorrState:
        return GetDialog(context, [
          GetAnimatedImage("assets/json/error.json"),
          GetMassage(massage!),
          GetRetryButton(AppString.Ok, context)
        ]);

      case StateRandererType.popupEmptyState:
        return GetItemsWidget(
            [GetAnimatedImage("assets/json/empty.json"), GetMassage(massage!)]);

      case StateRandererType.ContentState:
        return Container();

      default:
        return Container();
    }
  }

  Widget GetItemsWidget(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget GetAnimatedImage(String name) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(name),
    );
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
          style: TextStyle(color: ColorManage.black, fontSize: FontSize.s18),
        ),
      ),
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
                  if (stateRandererType ==
                      StateRandererType.fullScreenErorrState) {
                    retryActionFunction!.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTittle))),
      ),
    );
  }
}
