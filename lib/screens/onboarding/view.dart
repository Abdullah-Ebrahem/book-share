import 'package:book_share/core/cache_helper.dart';
import 'package:book_share/core/methods.dart';
import 'package:book_share/screens/master/view.dart';
import 'package:book_share/screens/onboarding/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          onPageChanged: (value) {
            setState(() {
              controller.currentScreen = value;
            });
          },
          children: List.generate(
            3,
            (index) => SafeArea(
                child: Column(
              children: [
                controller.currentScreen < 2
                    ? Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                controller.currentScreen = 2;
                              });
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xff969696)),
                            )),
                      )
                    : SizedBox(
                        height: 48.h,
                      ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      bottom:
                          controller.bottomPadding[controller.currentScreen].h,
                      top: controller.topPadding[controller.currentScreen].h),
                  child: Image.asset(
                    controller.onboardingImgs[controller.currentScreen],
                    width: MediaQuery.of(context).size.width,
                    height: controller.height[controller.currentScreen].h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  controller.onboardingTilte[controller.currentScreen],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.sp, color: const Color(0xff17191D)),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: 10.h,
                        height: 10.h,
                        margin: EdgeInsetsDirectional.only(
                            end: index == 2 ? 0 : 9.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == controller.currentScreen
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                      ),
                    )),
                SizedBox(
                  height: 25.h,
                ),
                controller.currentScreen == 2
                    ? Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 95.w, end: 95.w),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 45.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r)),
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            onPressed: () {
                              CacheHelper.saveNotFirstTime();
                              navigateTo(
                                  page: const MasterScreen(),
                                  withHistory: false);
                            },
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                      )
                    : const SizedBox.shrink()
              ],
            )),
          )),
    );
  }
}
