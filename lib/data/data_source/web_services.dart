import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/app_constants.dart';
import '../model/id.dart';
import '../model/user.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET(AppConstants.getEndPoint)
  Future<User> getUserDetailsById(@Path() String id);

  @PATCH(AppConstants.updateEndPoint)
  Future<Id> updateUserPoints(
      @Path() String id, @Body() Map<String, dynamic> userData);
}
