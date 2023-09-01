import 'package:book_share/screens/library/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final controller = LibraryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: controller.generalPhotos.length,
        padding: EdgeInsetsDirectional.only(
            top: 23.h, bottom: 20.h, start: 20.w, end: 20.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 202.h,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h,
            crossAxisCount: 2),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsetsDirectional.only(top: 23.h),
          decoration: BoxDecoration(
              color: controller.generalColors[index],
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.generalTitles[index],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 17.h,
              ),
              Image.asset(
                controller.generalPhotos[index],
                height: 118.66.h,
                width: 75.5.w,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}
