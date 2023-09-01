import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTopPick extends StatelessWidget {
  final String img;
  final String title;
  const ItemTopPick({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          img,
          width: 76.w,
          height: 115.h,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
