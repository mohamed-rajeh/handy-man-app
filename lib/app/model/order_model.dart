import 'dart:convert';

import 'package:ser/app/model/order_satate_model.dart';
import 'package:ser/app/model/service_model.dart';

class Order {
  final int? id;
  final int? custmor;
  final Service? service;
  final DateTime? date;
  final OrderState? state;
  final String? note;
  final double? lat;
  final double? long;
  final String? locationNote;
  Order({
    this.id,
    this.custmor,
    this.service,
    this.date,
    this.state,
    this.note,
    this.lat,
    this.long,
    this.locationNote,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'custmor': custmor,
      'service': service!.toMap(),
      'date': date?.millisecondsSinceEpoch,
      'state': {"id": state!.id, "name": state!.name},
      'note': note,
      'lat': lat,
      'long': long,
      'locationNote': locationNote,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as int : null,
      custmor: map['custmor'] != null ? map['custmor'] as int : null,
      service: map['service'] != null ? Service.fromMap(map['service']) : null,
      date: map['date'] != null ? DateTime.parse(map['date'] as String) : null,
      state: map['state'] != null ? OrderState.fromMap(map['state']) : null,
      note: map['note'] != null ? map['note'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      long: map['long'] != null ? map['long'] as double : null,
      locationNote:
          map['locationNote'] != null ? map['locationNote'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
