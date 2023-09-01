import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemButtons extends StatelessWidget {
  const ItemButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 35.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  backgroundColor: const Color(0xffFF6EA1)),
              onPressed: () {},
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 11.sp, color: Colors.white),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100.w, 35.h),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  backgroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                'Add to wishlist',
                style: TextStyle(fontSize: 11.sp, color: Colors.black),
              )),
        )
      ],
    );
  }
}
