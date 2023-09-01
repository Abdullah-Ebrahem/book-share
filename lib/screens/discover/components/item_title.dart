import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTitle extends StatelessWidget {
  final String title;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingStart;
  final double? paddingEnd;
  const ItemTitle(
      {super.key,
      required this.title,
      this.paddingTop,
      this.paddingBottom,
      this.paddingStart,
      this.paddingEnd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: paddingStart ?? 0,
          top: paddingTop ?? 0,
          bottom: paddingBottom ?? 0,
          end: paddingEnd ?? 0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
