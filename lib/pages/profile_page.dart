import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latres_mobile_123230049/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {

  ProfilePage({super.key});

  final profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
              profileC.username.value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 24),
            const Text(
              'Kesan:\n'
              'Jadi tahu Flutter dan cara bikin aplikasi mobile, '
              'walaupun bikin penuh storage.\n\n'

              'Pesan:\n'
              'Responsinya kayak gini aja mas, '
              'yang diubah API-nya aja -_-',

              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  profileC.logout();
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}