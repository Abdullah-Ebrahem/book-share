import 'dart:io';

import 'package:book_share/core/cache_helper.dart';
import 'package:book_share/screens/master/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final controller = MasterController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            title: Text(
              'Are you sure you want to quit?',
              style: TextStyle(fontSize: 17.sp),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    if (Platform.isAndroid) {
                      CacheHelper.clear();
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      CacheHelper.clear();
                      exit(0);
                    }
                  },
                  child: Text('Exit', style: TextStyle(fontSize: 14.sp))),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close', style: TextStyle(fontSize: 14.sp)))
            ],
          ),
        );
        return true;
      },
      child: Scaffold(
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            iconSize: 24.w,
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.currentIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_rounded), label: 'Library'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store_rounded), label: 'Store')
            ]),
      ),
    );
  }
}
