import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/web_services.dart';
import '../data/repository/web_services_repo.dart';
import '../presentation/business_logic/cubit/cach/cach_cubit.dart';
import '../presentation/business_logic/cubit/home_page/home_page_cubit.dart';
import '../presentation/business_logic/cubit/web_services/web_services_cubit.dart';
import 'app_constants.dart';

GetIt sL = GetIt.instance;
Future<void> getInit() async {
  SharedPreferences preferences = await _initCachInstance();
  sL.registerLazySingleton<SharedPreferences>(() => preferences);
  sL.registerLazySingleton<CachCubit>(() => CachCubit(sL<SharedPreferences>()));
  sL.registerLazySingleton<Dio>(() => initDio());
  sL.registerLazySingleton<WebServices>(() => WebServices(sL<Dio>()));
  sL.registerLazySingleton<WebServicesRepo>(
      () => WebServicesRepo(sL<WebServices>()));
  sL.registerLazySingleton<HomePageCubit>(() => HomePageCubit());
  sL.registerLazySingleton<WebServicesCubit>(
      () => WebServicesCubit(sL<WebServicesRepo>()));
}

Dio initDio() {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
  );
  Dio dio = Dio(baseOptions);
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
  ));
  return dio;
}

Future<SharedPreferences> _initCachInstance() async {
  return await SharedPreferences.getInstance();
}
