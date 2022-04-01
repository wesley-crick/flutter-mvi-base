import '../model/user.dart';

class LoginPageAction {
  LoginPageAction._();

  factory LoginPageAction.getRandomUser() = GetRandomUser;
  factory LoginPageAction.getUsers() = GetUsers;

  factory LoginPageAction.updateUser(User user) = UpdateUser;
  factory LoginPageAction.updateUsers(List<User> users) = UpdateUsers;

  factory LoginPageAction.saveName(String name) = SaveName;
}

class GetRandomUser extends LoginPageAction {
  GetRandomUser(): super._();
}
class UpdateUser extends LoginPageAction {
  User user;

  UpdateUser(this.user): super._();
}

class GetUsers extends LoginPageAction {
  GetUsers(): super._();
}
class UpdateUsers extends LoginPageAction {
  List<User> users;

  UpdateUsers(this.users): super._();
}

class SaveName extends LoginPageAction {
  String name;

  SaveName(this.name): super._();
}