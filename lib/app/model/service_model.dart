class Service {
  int? id;
  String? name;
  int? category;
  String? picture;
  double? price;
  int? available;
  String? description;
  String? details;

  Service(
      {this.id,
      this.name,
      this.category,
      this.picture,
      this.price,
      this.available,
      this.description,
      this.details});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    category = json['category'] as int?;
    picture = json['picture'] as String?;
    price = json['price'] as double?;
    available = json['available'] as int?;
    description = json['description'] as String?;
    details = json['details'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['picture'] = picture;
    data['price'] = price;
    data['available'] = available;
    data['description'] = description;
    data['details'] = details;
    return data;
  }
}
