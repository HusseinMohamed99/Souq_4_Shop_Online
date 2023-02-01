import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_4_shop_online/Desktop/desktop_screen.dart';
import 'package:souq_4_shop_online/Home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (kDebugMode) {
                    print(constraints.minWidth.toInt());
                  }
                  if (constraints.minWidth.toInt() <= 560) {
                    return const HomeScreen();
                  }
                  return const DesktopScreen();
                }),
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
            },
            initialRoute: '/',
          );
    });


  }
}
