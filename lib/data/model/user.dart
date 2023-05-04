import 'points.dart';

class User {
  final String id;
  final String name;
  final String address;
  final Points points;

  User(this.id, this.name, this.address, this.points);

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      data['fields']["id"]['stringValue'],
      data['fields']["name"]['stringValue'],
      data['fields']["address"]['stringValue'],
      Points(
        int.parse(data['fields']["points_plastic"]['integerValue']),
        int.parse(data['fields']["points_paper"]['integerValue']),
        int.parse(data['fields']["points_metal"]['integerValue']),
        int.parse(data['fields']["points_organic"]['integerValue']),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fields": {
        "points_plastic": {"integerValue": "${points.plastic}"},
        "points_paper": {"integerValue": "${points.paperAndCarton}"},
        "points_metal": {"integerValue": "${points.metal}"},
        "points_organic": {"integerValue": "${points.organicMaterials}"},
        "id": {"stringValue": id},
        "name": {"stringValue": name},
        "address": {"stringValue": address}
      }
    };
  }
}
