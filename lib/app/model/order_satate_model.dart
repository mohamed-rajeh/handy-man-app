// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderState {
  final int? id;
  final String? name;

  OrderState({this.id, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory OrderState.fromMap(Map<String, dynamic> map) {
    return OrderState(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderState.fromJson(String source) =>
      OrderState.fromMap(json.decode(source) as Map<String, dynamic>);
}
