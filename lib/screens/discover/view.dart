import 'package:book_share/screens/discover/components/custom_search.dart';
import 'package:book_share/screens/discover/components/item_title.dart';
import 'package:book_share/screens/discover/components/item_top_picks.dart';
import 'package:book_share/screens/discover/components/item_topic.dart';
import 'package:book_share/screens/discover/components/row_books.dart';
import 'package:book_share/screens/discover/controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final controller = DiscoverController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/discover_back.png',
                  width: MediaQuery.of(context).size.width,
                  height: 381.53.h,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/discover.png',
                  width: MediaQuery.of(context).size.width,
                  height: 359.53.h,
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44.h,
                    ),
                    Card(
                      margin:
                          EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                      elevation: 5,
                      shape: const StadiumBorder(),
                      child: TextFormField(
                        onTap: () {
                          showSearch(
                              context: context, delegate: CustomSearch());
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Books, Authors',
                            contentPadding:
                                EdgeInsetsDirectional.only(top: 14.5.h),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.w,
                            ),
                            suffixIcon: Image.asset(
                              'assets/images/iconfilt.jpg',
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 18.w),
                      child: Text(
                        'Our Top Picks',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CarouselSlider(
                        items: List.generate(
                            controller.topPicks.length,
                            (index) => ItemTopPick(
                                  img: controller.topPicks[index],
                                  title: controller.topPicksTitle[index],
                                )),
                        options: CarouselOptions(
                          viewportFraction: 0.3,
                          enlargeCenterPage: true,
                          aspectRatio: 1.5,
                          autoPlay: true,
                          pauseAutoPlayOnTouch: true,
                        ))
                  ],
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.topicsLogo.length,
                    (index) => ItemDiscoverTopic(
                          isLast: index == controller.topicsLogo.length - 1,
                          isFirst: index == 0,
                          img: controller.topicsLogo[index],
                          topic: controller.topics[index],
                        )),
              ),
            ),
            ItemTitle(
              title: 'Trending Books',
              paddingTop: 29.5.h,
              paddingStart: 16.w,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.w, end: 16.w, bottom: 37.5.h, top: 14.5.h),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 12.5.w,
                runSpacing: 14.5.h,
                children: List.generate(
                    6,
                    (index) => Image.asset(
                          controller.trendingBooks[index],
                          width: 105.7.w,
                          height: 169.95.h,
                          fit: BoxFit.fill,
                        )),
              ),
            ),
            ItemTitle(
              title: 'Best Share',
              paddingStart: 16.w,
              paddingBottom: 11.h,
            ),
            RowBooks(
                img: controller.bestShareBooks,
                title: controller.bestShareBooksTitles,
                length: controller.bestShareBooks.length),
            ItemTitle(
              title: 'Recently Viewed',
              paddingTop: 39.h,
              paddingBottom: 20.h,
              paddingStart: 16.w,
            ),
            RowBooks(
              img: controller.recentlyViewedBooks,
              title: controller.recentlyViewedBooksTitles,
              length: controller.bestShareBooks.length,
            )
          ],
        ),
      ),
    );
  }
}
