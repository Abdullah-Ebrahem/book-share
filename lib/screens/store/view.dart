import 'package:book_share/screens/discover/components/custom_search.dart';
import 'package:book_share/screens/store/components/item_button.dart';
import 'package:book_share/screens/store/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final controller = StoreController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          elevation: 5,
          shape: const StadiumBorder(),
          child: TextFormField(
            onTap: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Books, Authors',
                contentPadding: EdgeInsetsDirectional.only(top: 14.5.h),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.w,
                ),
                suffixIcon: Image.asset(
                  'assets/images/iconfilt.jpg',
                )),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(top: 33.h, start: 10.w, end: 10.w),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          height: 175.h,
          margin: EdgeInsetsDirectional.only(bottom: 24.h),
          child: Row(
            children: [
              Image.asset(
                controller.storeBooks[index],
                height: 175.h,
                width: 115.94.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      controller.storeBooksTitle[index],
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff242126)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      controller.storeBooksSubTitle[index],
                      style: TextStyle(
                          fontSize: 12.sp, color: const Color(0xff242126)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      itemSize: 20.w,
                      maxRating: 5,
                      minRating: 1,
                      allowHalfRating: true,
                      glowColor: Colors.red,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color(0xffFF6EA1),
                      ),
                      onRatingUpdate: (value) {},
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      controller.storeBooksOverrview[index],
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xff242126),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const ItemButtons()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
