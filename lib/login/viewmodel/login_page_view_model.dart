import 'package:flutter_demo_app/login/repository/user_repository.dart';
import 'package:get/get.dart';
import '../../core/mvi/stateful_view_model.dart';
import '../model/user.dart';
import 'login_page_action.dart';
import 'login_page_state.dart';

class LoginPageViewModel
    extends StatefulViewModel<LoginPageState, LoginPageAction> {

  final UserRepository _userRepository = Get.find();

  LoginPageViewModel(): super(
      LoginPageState(
        isLoading: false,
        name: "",
        users: List.empty(growable: true)
      )
  );

  @override
  LoginPageState reduce(LoginPageAction action) {
      switch(action.runtimeType) {
        case GetRandomUser:
          return _reduceGetRandomUser();
        case UpdateUser:
          return _reduceUserLoaded((action as UpdateUser).user);
        case SaveName:
          return _reduceSaveName((action as SaveName).name);
        case GetUsers:
          return _reduceGetUsers();
        case UpdateUsers:
          return _reduceUpdateUsers((action as UpdateUsers).users);
        case DeleteUser:
          return _reduceDeleteUser((action as DeleteUser).user);
      }
      return state;
  }

  LoginPageState _reduceGetRandomUser() {
    _getRandomUser();
    return state.copyWith(
      isLoading: true,
      name: "",
    );
  }

  _getRandomUser() async {
    User? user = await _userRepository.getRandomUser();
    if (user != null) {
      send(UpdateUser(user));
    }
  }

  LoginPageState _reduceUserLoaded(User user) {
    return state.copyWith(
      isLoading: false,
      name: user.name,
    );
  }

  LoginPageState _reduceSaveName(String name) {
    _saveUser(name);
    return state.copyWith(
      name: ""
    );
  }

  void _saveUser(String name) async {
    await _userRepository.saveUser(name);
    send(GetUsers());
  }

  LoginPageState _reduceGetUsers() {
    send(UpdateUsers(
      _userRepository.getUsers()
    ));

    return state;
  }

  LoginPageState _reduceUpdateUsers(List<User> users) {
    return state.copyWith(
      users: users
    );
  }

  LoginPageState _reduceDeleteUser(User user) {
    deleteUser(user);
    return state;
  }

  void deleteUser(User user) async {
    await _userRepository.deleteUser(user);
    send(GetUsers());
  }
}