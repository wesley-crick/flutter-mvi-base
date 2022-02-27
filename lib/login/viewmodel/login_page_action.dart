import '../network/model/user_dto.dart';

class LoginPageAction {
  LoginPageAction._();

  factory LoginPageAction.onEnterClicked() = OnEnterClicked;
  factory LoginPageAction.onResetClicked() = OnResetClicked;
  factory LoginPageAction.usersLoaded(List<UserDto> users) = UsersLoaded;
}

class OnEnterClicked extends LoginPageAction {
  OnEnterClicked(): super._();
}

class OnResetClicked extends LoginPageAction {
  OnResetClicked(): super._();
}

class UsersLoaded extends LoginPageAction {
  List<UserDto> users;

  UsersLoaded(this.users): super._();
}