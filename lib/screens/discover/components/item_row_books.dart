import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemRowBooks extends StatelessWidget {
  final String img;
  final String title;
  const ItemRowBooks({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 15.w),
      child: Column(
        children: [
          Image.asset(
            img,
            width: 122.5.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
          Text.rich(TextSpan(
              text: '${title.split('/').first}\n',
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
              children: [
                TextSpan(
                    text: title.split('/').last,
                    style: TextStyle(
                        fontSize: 11.sp, color: const Color(0xff212121)))
              ])),
        ],
      ),
    );
  }
}
