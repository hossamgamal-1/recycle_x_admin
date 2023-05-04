import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cach_state.dart';

class CachCubit extends Cubit<CachState> {
  CachCubit(this.preferences) : super(CachInitialState());
  final SharedPreferences preferences;

  Future cachUserUid(String uid) async {
    await preferences.setString('uid', uid);
  }

  Future<void> clearUserUid() async {
    await preferences.remove('uid');
  }

  bool isUser() {
    return getUid() != '';
  }

  String? getUid() {
    return preferences.getString('uid');
  }

  Future<String> getIdToFetchUserDetails() async {
    String? uId = getUid();
    if (uId != null) {
      var snapShot = await FirebaseDatabase.instance.ref(uId).get();
      return snapShot.value.toString();
    }
    return '';
  }
}
