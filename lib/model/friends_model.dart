import 'package:flutter/foundation.dart';

class FriendsModel {
  final int? id;
  final String? name;
  final int? age;
  final String? description;

  const FriendsModel(
      {this.id,
      @required this.name,
      @required this.age,
      @required this.description});

  toMap() => {'id': id, 'name': name, 'age': age, 'description': description};

  @override
  String toString() => "$id ${name ?? ""} ${description ?? ""} ${age ?? 0}";
}
