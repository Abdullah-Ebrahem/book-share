import 'package:book_share/core/methods.dart';
import 'package:book_share/screens/choose_topics/components/item_topic.dart';
import 'package:book_share/screens/choose_topics/controller.dart';
import 'package:book_share/screens/master/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseTopics extends StatefulWidget {
  const ChooseTopics({super.key});

  @override
  State<ChooseTopics> createState() => _ChooseTopicsState();
}

class _ChooseTopicsState extends State<ChooseTopics> {
  final controller = TopicsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/backgroundBar.jpg',
                    fit: BoxFit.fill,
                    height: 180.h,
                    width: MediaQuery.of(context).size.width),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 45.5.h, start: 25.5.w),
                    child: Text(
                      'Welcome\nChoose the topics',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 43.5.h,
            ),
            Wrap(
              runSpacing: 14.w,
              spacing: 33.8.h,
              children: List.generate(
                  9,
                  (index) => ItemTopic(
                      onTap: () {
                        setState(() {
                          controller.selectedTopic = index;
                        });
                      },
                      isSelected: controller.selectedTopic == index,
                      topicLogo: controller.topicsLogo[index],
                      topic: controller.topics[index])),
            ),
            SizedBox(
              height: 33.8.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'More Topics',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.sp,
                    fontSize: 15.sp,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 16.5.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w),
              child: ElevatedButton(
                  onPressed: () {
                    navigateTo(page: const MasterScreen(), withHistory: false);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 45.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r)),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
