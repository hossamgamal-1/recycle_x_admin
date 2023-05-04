import '../data_source/web_services.dart';
import '../model/id.dart';
import '../model/user.dart';

class WebServicesRepo {
  final WebServices _webServices;

  WebServicesRepo(this._webServices);

  Future<User> getUserDetailsById(String id) async {
    return await _webServices.getUserDetailsById(id);
  }

  Future<Id> updateUserPoints(String id, Map<String, dynamic> userData) async {
    return await _webServices.updateUserPoints(id, userData);
  }
}
