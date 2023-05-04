import '../../app/app_constants.dart';

class Id {
  final String id;

  Id(this.id);

  factory Id.fromJson(Map<String, dynamic> data) {
    String path = data['name'];
    return Id(path.split('${AppConstants.collection}/')[1]);
  }
}
