import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_4_shop_online/ui/Desktop/desktop_screen.dart';
import 'package:souq_4_shop_online/ui/Home/home_screen.dart';
import 'package:souq_4_shop_online/ui/Splash/splash_screen.dart';
import 'package:souq_4_shop_online/ui/login/login_screen.dart';
import 'package:souq_4_shop_online/ui/register/register_screen.dart';

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
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: const Color.fromARGB(255, 0, 65, 130),
              secondaryHeaderColor: Colors.white,
            ),
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
              SplashScreen.routeName: (_) => const SplashScreen(),
              LoginScreen.routeName: (_) =>  LoginScreen(),
              RegisterScreen.routeName: (_) => RegisterScreen(),
            },
            initialRoute: SplashScreen.routeName,
          );
        });
  }
}
