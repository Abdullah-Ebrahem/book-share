import 'package:book_share/core/cache_helper.dart';
import 'package:book_share/core/methods.dart';
import 'package:book_share/screens/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: const SplashScreen(),
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Book Share',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color(0xffFF6EA1),
              appBarTheme: const AppBarTheme(
                  elevation: 0, backgroundColor: Colors.white),
              scaffoldBackgroundColor: Colors.white),
          home: child,
        );
      },
    );
  }
}
