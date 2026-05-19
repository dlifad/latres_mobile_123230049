class Model {
  final int id;
  final String name;
  final String image;
  final double rating;
  final List genres;
  final String summary;

  Model({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.genres,
    required this.summary,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
      image: json['image']?['medium'] ?? '',
      rating: (json['rating']['average'] ?? 0).toDouble(),
      genres: json['genres'] ?? [],
      summary: json['summary'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'genres': genres,
      'summary': summary,
    };
  }
}