import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latres_mobile_123230049/controllers/show_controller.dart';
import 'package:latres_mobile_123230049/widgets/show_card.dart';
import 'detail_page.dart';

class ShowListPage extends StatelessWidget {

  ShowListPage({super.key});

  final showC = Get.put(ShowController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ngefilm'),
      ),
      body: Obx(() {
        if (showC.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),

          itemCount: showC.showList.length,
          itemBuilder: (context, index) {
            final show = showC.showList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailPage(show: show));
              },
              child: ShowCard(show: show),
            );
          },
        );
      }),
    );
  }
}