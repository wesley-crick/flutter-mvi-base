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
  void reduce(LoginPageAction action) {
      switch(action.runtimeType) {
        case GetRandomUser:
          _reduceGetRandomUser();
          break;
        case UpdateUser:
          _reduceUserLoaded((action as UpdateUser).user);
          break;
        case SaveName:
          _reduceSaveName((action as SaveName).name);
          break;
        case GetUsers:
          _reduceGetUsers();
          break;
        case UpdateUsers:
          _reduceUpdateUsers((action as UpdateUsers).users);
          break;
      }
  }

  void _reduceGetRandomUser() async {
    updateState(
        state.copyWith(
          isLoading: true,
          name: "",
        )
    );

    User? user = await _userRepository.getRandomUser();
    if (user != null) {
      send(UpdateUser(user));
    }
  }

  void _reduceUserLoaded(User user) {
    updateState(
        state.copyWith(
          isLoading: false,
          name: user.name,
        )
    );
  }

  _reduceSaveName(String name) async {
    await _userRepository.saveUser(name);
    updateState(
      state.copyWith(
        name: ""
      )
    );
    send(GetUsers());
  }

  _reduceGetUsers() {
    send(UpdateUsers(
      _userRepository.getUsers()
    ));
  }

  _reduceUpdateUsers(List<User> users) {
    updateState(
      state.copyWith(
        users: users
      )
    );
  }
}