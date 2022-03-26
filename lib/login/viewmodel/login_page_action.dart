import '../model/user.dart';

class LoginPageAction {
  LoginPageAction._();

  factory LoginPageAction.onEnterClicked() = OnEnterClicked;
  factory LoginPageAction.onResetClicked() = OnResetClicked;
  factory LoginPageAction.usersLoaded(User user) = UserLoaded;
}

class OnEnterClicked extends LoginPageAction {
  OnEnterClicked(): super._();
}

class OnResetClicked extends LoginPageAction {
  OnResetClicked(): super._();
}

class UserLoaded extends LoginPageAction {
  User user;

  UserLoaded(this.user): super._();
}