import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  final prefs = await SharedPreferences.getInstance();
  final isLogin = prefs.getBool('isLogin') ?? false;
  runApp(
    MyApp(isLogin: isLogin),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFFF3B30),
          secondary: Color(0xFFFF453A),
          surface: Color(0xFF1C1C1E),
        ),
        scaffoldBackgroundColor:Color(0xFF111111),
      ),

      home: isLogin
          ? const HomePage()
          : LoginPage(),
    );
  }
}