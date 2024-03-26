// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'picture': picture,
      'price': price,
      'available': available,
      'description': description,
      'details': details,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as int : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      available: map['available'] != null ? map['available'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}
