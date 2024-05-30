import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_ui/Auth/login_screen.dart';
import 'package:stylish_ui/screen/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:stylish_ui/screen/checkout_screen.dart/checkout_screen.dart';
import 'package:stylish_ui/screen/profile_screen/profile_screen.dart';
import 'package:stylish_ui/screen/splash_screen/splash_screen.dart';
import 'package:stylish_ui/screen/welcome_screen/welcome_screen.dart';
import 'screen/main_screen/cart_screen.dart';
import 'screen/main_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          useMaterial3: true,
        ),
        home: CheckoutScreen(),
      ),
    );
  }
}
