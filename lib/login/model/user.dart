import 'package:flutter_demo_app/login/database/user_dao.dart';

import '../network/model/user_dto.dart';

class User{
  int id;
  String name;
  String email;
  String gender;
  String status;

  User() :
    id = 0,
    name = "",
    email = "",
    gender = "",
    status = "";


  User.fromData(this.id, this.name, this.email,this.gender, this.status);

  User.fromDao(UserDao userDao) :
        id = userDao.id,
        name = userDao.name ?? "",
        email = userDao.email ?? "",
        gender = userDao.gender ?? "",
        status = userDao.status ?? "";

  User.fromDto(UserDto userDto) :
        id = userDto.id ?? 0,
        name = userDto.name ?? "",
        email = userDto.email ?? "",
        gender = userDto.gender ?? "",
        status = userDto.status ?? "";
}