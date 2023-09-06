import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/assets_manege.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/values_managers.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/onboarding_screen/onbording_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset('imeges/splash_logo.png')),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => onboardingScreen())),
                      (route) => false);
                },
                child: Card(
                  shape: CircleBorder(side: BorderSide.none),
                  elevation: 30,
                  child: CircleAvatar(
                    backgroundColor: ColorManage.white,
                    radius: 33,
                    child: Text(
                      'Go',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: ColorManage.Primary,
    );
  }
}
