class Service {
  final int id;
  final String name;
  final int category;
  final String? photo;
  final double price;

  final String description;
  final String? details;

  Service(
      {required this.id,
      required this.name,
      required this.category,
      this.photo,
      required this.price,
      required this.description,
      this.details});
}
