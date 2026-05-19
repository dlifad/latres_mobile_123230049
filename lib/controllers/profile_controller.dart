import 'package:get/get.dart';
import 'package:latres_mobile_123230049/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  RxString username = ''.obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {

    final prefs = await SharedPreferences.getInstance();

    username.value = prefs.getString('username') ?? 'User';
  }

  Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    Get.offAll(() => LoginPage());
  }
}