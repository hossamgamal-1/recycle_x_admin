import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/user.dart';
import '../../../../data/repository/web_services_repo.dart';

part 'web_services_state.dart';

class WebServicesCubit extends Cubit<WebServicesState> {
  WebServicesCubit(this._webServicesRepo) : super(WebServicesInitialState());
  final WebServicesRepo _webServicesRepo;

  Future<User?> getUserDetailsById(String id) async {
    try {
      emit(WaitingState());
      User user = await _webServicesRepo.getUserDetailsById(id);
      emit(LoadedState(user));
      return user;
    } catch (error) {
      emit(FailureState(error.toString()));
    }
    return null;
  }

  Future<User?> updateUserDetails(
      String id, Map<String, dynamic> userData) async {
    try {
      emit(WaitingState());
      await _webServicesRepo.updateUserPoints(id, userData);
      User user = await _webServicesRepo.getUserDetailsById(id);
      emit(LoadedState(user));
    } catch (error) {
      emit(FailureState(error.toString()));
    }
    return null;
  }

  Future<void> updateClientUserPoint(Map<String, dynamic> userData) async {
    // String documentId = await sL<CachCubit>().getIdToFetchUserDetails();
    String documentId = 'Qp4cpztHFCSgqi7l7l5u';

    await updateUserDetails(documentId, userData);
  }
}
