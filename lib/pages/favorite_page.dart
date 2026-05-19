import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latres_mobile_123230049/controllers/favorite_controller.dart';
import 'package:latres_mobile_123230049/models/model.dart';
import 'package:latres_mobile_123230049/pages/detail_page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final favC = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),

      body: Obx(() {
        if (favC.favorites.isEmpty) {
          return const Center(child: Text('Belum ada favorit'));
        }

        return ListView.builder(
          itemCount: favC.favorites.length,

          itemBuilder: (context, index) {
            final data = favC.favorites[index];

            final show = Model(
              id: data['id'],
              name: data['name'],
              image: data['image'],
              rating: (data['rating'] as num).toDouble(),
              genres: List<String>.from(data['genres']),
              summary: data['summary'],
            );

            return GestureDetector(
              onTap: () {
                Get.to(() => DetailPage(show: show));
              },

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        show.image,
                        width: 70,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            show.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text('${show.rating}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Text(show.genres.join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),

                      onPressed: () {
                        favC.toggleFavorite(show);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
