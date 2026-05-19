import 'package:get/get.dart';
import 'package:latres_mobile_123230049/pages/home_page.dart';
import 'package:latres_mobile_123230049/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  Future<bool> login(
    String username,
    String password,
  ) async {

    if (username == 'admin' && password == 'admin123') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);
      await prefs.setString('username', username);
      Get.offAll(() => const HomePage());
      return true;
    }
    return false;
  }

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => LoginPage());
  }
}