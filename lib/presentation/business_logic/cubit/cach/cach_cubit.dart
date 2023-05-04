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

  // Future cachUser(User user) async {
  //   await preferences.setString('user', json.encode(user.toJson()));
  // }

  // Future<User?> getCachedUser(User user) async {
  //   String? userString = preferences.getString('user');
  //   if (userString != null) {
  //     var userJson = json.decode(userString);
  //     User user = User.fromJson(userJson);
  //     return user;
  //   }
  //   return null;
  // }

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
    // TODO
    // String? uId = getUid();
    String uId = 'u2bSWwjziac9vzj3TlGR8R8NapD2';
    print('uId = $uId');

    var snapShot = await FirebaseDatabase.instance.ref(uId).get();
    return snapShot.value.toString();
    return '';
  }
}
