class Car {
  final String id;
  final String name;
  final String brand;
  final String category;
  final String imageUrl;
  final double pricePerDay;
  final String transmission;
  final int seats;
  final double rating;
  final List<String> features;
  final String? description;

  const Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.imageUrl,
    required this.pricePerDay,
    required this.transmission,
    required this.seats,
    required this.rating,
    required this.features,
    this.description,
  });
} 