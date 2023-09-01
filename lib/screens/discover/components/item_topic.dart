import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDiscoverTopic extends StatelessWidget {
  final bool isFirst;
  final String img;
  final String topic;
  final bool? isLast;
  const ItemDiscoverTopic(
      {super.key,
      required this.isFirst,
      required this.img,
      required this.topic,
      this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: isLast! ? 16.w : 0),
      child: Column(
        children: [
          Container(
            width: 65.w,
            height: 65.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img)),
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: isFirst
                ? Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15.48.w,
                  )
                : null,
          ),
          SizedBox(
            height: 4.5.h,
          ),
          Text(
            topic,
            style: TextStyle(fontSize: 10.sp, color: Colors.black),
          )
        ],
      ),
    );
  }
}
