import 'package:flutter_demo_app/login/database/user_dao.dart';

import '../network/model/user_dto.dart';

class User{
  int id;
  String name;

  User() :
    id = 0,
    name = "";


  User.fromData(this.id, this.name);

  User.fromDao(UserDao userDao) :
      id = userDao.id,
      name = userDao.name;

  User.fromDto(UserDto userDto) :
      id = 0,
      name = "${userDto.name?.first} ${userDto.name?.last}";
}