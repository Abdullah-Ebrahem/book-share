import 'dart:async';

import 'package:book_share/core/cache_helper.dart';
import 'package:book_share/core/methods.dart';
import 'package:book_share/screens/master/view.dart';
import 'package:book_share/screens/onboarding/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigateTo(
          page: CacheHelper.getIfFirstTime()
              ? const OnBoardingScreen()
              : const MasterScreen(),
          withHistory: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_book.png',
                width: 32.95.w,
                height: 51.3.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 11.9.h,
              ),
              Text(
                'Book Share',
                style: TextStyle(
                    color: Colors.white, fontSize: 20.sp, fontFamily: 'Shadow'),
              )
            ],
          )),
    );
  }
}
