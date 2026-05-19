import 'package:get/get.dart';
import 'package:latres_mobile_123230049/models/model.dart';
import 'package:latres_mobile_123230049/services/api_service.dart';

class ShowController extends GetxController {

  var isLoading = true.obs;

  var showList = <Model>[].obs;

  @override
  void onInit() {
    fetchShows();
    super.onInit();
  }

  void fetchShows() async {

    try {

      isLoading(true);

      final data = await ApiService.getShows();

      showList.value =
          data.map<Model>((e) =>
              Model.fromJson(e)).toList();

    } finally {

      isLoading(false);

    }
  }
}