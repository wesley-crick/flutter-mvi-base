class LoginPageAction {
  LoginPageAction._();

  factory LoginPageAction.onEnterClicked() = OnEnterClicked;
  factory LoginPageAction.onResetClicked() = OnResetClicked;
}

class OnEnterClicked extends LoginPageAction {
  OnEnterClicked(): super._();
}

class OnResetClicked extends LoginPageAction {
  OnResetClicked(): super._();
}