import 'dart:async';

import 'package:flutter_demo_app/login/database/user_dao.dart';
import 'package:flutter_demo_app/login/model/user.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

import '../../core/database/object_box.dart';
import '../../objectbox.g.dart';
import '../network/login_rest_client.dart';
import '../network/model/user_dto.dart';

class UserRepository extends GetxController with UiLoggy {
  final ObjectBox _objectBox = Get.find();
  late Box<UserDao> userBox = _objectBox.store.box();

  final LoginRestClient client = Get.find();

  Rx<User> getUser() {
    var rx = User().obs;
    loggy.error("Get users async");
    unawaited(_getUserAsync(rx));
    loggy.error("after users async");
    return rx;
  }

  _getUserAsync(Rx<User> rx) async {
    await Future.microtask(() {
      UserDao userDao = _getUserDao();
      loggy.error("UserDao: ${userDao.name}");
      rx.value = User.fromDao(userDao);
    });

    var response = await client.getUsers();
    List<UserDto> users = response.data ?? List.empty();
    loggy.error("UserDto length: ${users.length}");
    rx.value = User.fromDto(users.first);
  }

  UserDao _getUserDao() {
    return userBox.getAll().first;
  }

}