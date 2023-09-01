import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_row_books.dart';

class RowBooks extends StatelessWidget {
  final List<String> img;
  final List<String> title;
  final int length;
  const RowBooks(
      {super.key,
      required this.img,
      required this.title,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Row(
          children: List.generate(length,
              (index) => ItemRowBooks(img: img[index], title: title[index])),
        ));
  }
}
