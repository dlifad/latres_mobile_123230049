import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  final box = Hive.box('favorites');

  RxList favorites = [].obs;

  @override
  void onInit() {
    favorites.value = box.values.toList();
    super.onInit();
  }

  bool isFavorite(int id) {
    return favorites.any((item) => item['id'] == id);
  }

  void toggleFavorite(dynamic show) {
    final exist = isFavorite(show.id);

    if (exist) {
      final key = box.keys.firstWhere((k) => box.get(k)['id'] == show.id);

      box.delete(key);

      Get.snackbar('Favorite', '${show.name} dihapus dari favorit',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      box.add(show.toJson());

      Get.snackbar('Favorite', '${show.name} ditambahkan ke favorit',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    favorites.value = box.values.toList();
  }
}
