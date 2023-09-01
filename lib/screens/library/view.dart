import 'package:book_share/screens/library/components/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Card(
              elevation: 5,
              shape: const StadiumBorder(),
              child: TextFormField(
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
            toolbarHeight: 80.h,
            bottom: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Theme.of(context).primaryColor,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 24.sp),
                indicatorColor: Colors.transparent,
                tabs: const [
                  Text(
                    'General',
                  ),
                  Text(
                    'New',
                  ),
                  Text(
                    'Most Viewed',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            const GeneralScreen(),
            Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            )
          ])),
    );
  }
}
