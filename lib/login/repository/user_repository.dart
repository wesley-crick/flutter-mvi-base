import 'dart:async';

import 'package:flutter_demo_app/login/database/user_dao.dart';
import 'package:flutter_demo_app/login/model/user.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

import '../../core/database/object_box.dart';
import '../../objectbox.g.dart';
import '../network/user_rest_client.dart';
import '../network/model/user_dto.dart';

class UserRepository with UiLoggy {
  final ObjectBox _objectBox = Get.find();
  late final Box<UserDao> _userBox = _objectBox.store.box();

  final UserRestClient client = Get.find();

  Future<User?> getRandomUser() async {
    try {
      var response = await client.getUsers();
      List<UserDto> users = response.results ?? List.empty();
      return User.fromDto(users.first);
    } catch(e) {
      loggy.error(e);
      return null;
    }
  }

  saveUser(String name) async {
    try {
      await _userBox.putAsync(UserDao(
          name: name
      ));
    } catch(e) {
      loggy.error(e);
    }
  }

  List<User> getUsers() {
    return _userBox.getAll().map( (userDao) =>
      User.fromDao(userDao)
    ).toList();
  }

  deleteUser(User user) {
    _userBox.remove(user.id);
  }

  //============================================================================

  /// Fancy code to get a user from the DB then updated from the network
  Rx<User> _tempgetUser() {
    var rx = User().obs;
    unawaited(_getUserAsync(rx));
    return rx;
  }

  _getUserAsync(Rx<User> rx) async {
    try {
      await Future.wait<dynamic>([_emitUserFromDao(rx), _emitUserFromDto(rx)]);
    } catch(e) {
      loggy.error(e);
    }
  }

  _emitUserFromDao(Rx<User> rx) async {
    await Future.microtask(() {
      UserDao? userDao = _getUserDao();
      if(userDao != null) {
        rx.value = User.fromDao(userDao);
      }
    });
  }

  _emitUserFromDto(Rx<User> rx) async {
    var response = await client.getUsers();
    List<UserDto> users = response.results ?? List.empty();
    rx.value = User.fromDto(users.first);
  }

  /// Returns first user or null if none are found
  UserDao? _getUserDao() {
    var users = _userBox.getAll();
    if (users.isNotEmpty) {
      return users.first;
    } else {
      return null;
    }
  }

}