import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latres_mobile_123230049/controllers/favorite_controller.dart';
import 'package:latres_mobile_123230049/models/model.dart';

class DetailPage extends StatelessWidget {

  final Model show;

  DetailPage({
    super.key,
    required this.show,
  });

  final favC = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    final image = show.image;
    final rating = show.rating;
    final genres = show.genres.join(', ');
    final summary = show.summary.replaceAll(RegExp(r'<[^>]*>'), '');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Detail'),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 420,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(show.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text('$rating',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(genres,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.redAccent,
                            padding:const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius:.circular(10),
                            ),
                          ),

                          onPressed: () {},

                          icon: const Icon(Icons.play_arrow, color: Colors.white),

                          label: const Text('Nonton',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius:BorderRadius.circular(10),
                        ),
                        child: Obx(() {
                          final isFav = favC.isFavorite(show.id);
                          return IconButton(
                            onPressed: () {
                              favC.toggleFavorite(show);
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.white,
                            ),
                          );
                        })
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  const Text('Overview',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(summary,
                    style: TextStyle(
                      color: Colors.grey[300],
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}