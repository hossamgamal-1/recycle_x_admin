import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_injection.dart';
import '../../../../data/model/user.dart';
import '../../../../data/repository/web_services_repo.dart';
import '../cach/cach_cubit.dart';

part 'web_services_state.dart';

class WebServicesCubit extends Cubit<WebServicesState> {
  WebServicesCubit(this._webServicesRepo) : super(WebServicesInitialState());
  final WebServicesRepo _webServicesRepo;

  Future<User?> getUserDetailsById(String id) async {
    try {
      emit(WaitingState());
      User user = await _webServicesRepo.getUserDetailsById(id);
      // await sL<CachCubit>().cachUser(user);
      emit(LoadedState(user));
      return user;
    } catch (error) {
      emit(FailureState(error.toString()));
    }
    return null;
  }

  Future<void> updateUserDetails(
      String id, Map<String, dynamic> userData) async {
    try {
      emit(WaitingState());
      await _webServicesRepo.updateUserPoints(id, userData);
      await _webServicesRepo.getUserDetailsById(id);
    } catch (error) {
      emit(FailureState(error.toString()));
    }
  }

  Future<void> updateClientUserPoint(Map<String, dynamic> userData) async {
    String documentId = await sL<CachCubit>().getIdToFetchUserDetails();
    try {
      emit(WaitingState());
      await updateUserDetails(documentId, userData);
      emit(PatchedDataState());
    } catch (e) {
      emit(FailureState(e.toString()));
    }
  }
}
