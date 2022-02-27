import 'package:flutter_demo_app/login/network/login_rest_client.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/mvi/stateful_view_model.dart';
import '../network/model/user_dto.dart';
import 'login_page_action.dart';
import 'login_page_state.dart';

class LoginPageViewModel
    extends StatefulViewModel<LoginPageState, LoginPageAction> {

  final LoginRestClient client = Get.find();

  LoginPageViewModel(): super(
      LoginPageState(
        isLoading: false,
        counter: 0,
        users: List.empty()
      )
  );

  @override
  void reduce(LoginPageAction action) {
      switch(action.runtimeType) {
        case OnEnterClicked:
          _reduceOnEnterClicked();
          break;
        case OnResetClicked:
          _reduceReset();
          break;
        case UsersLoaded:
          _reduceUsersLoaded((action as UsersLoaded).users);
          break;
      }
  }

  void _reduceOnEnterClicked() async {
    updateState(
        state.copyWith(
          isLoading: true,
          counter: state.counter + 1
        )
    );

    var response = await client.getUsers();
    List<UserDto> users = response.data ?? List.empty();
    send(UsersLoaded(users));
  }

  void _reduceReset() {
    updateState(
        state.copyWith(
          isLoading: false,
          users: List.empty()
        )
    );
  }

  void _reduceUsersLoaded(List<UserDto> users) {
    updateState(
        state.copyWith(
          isLoading: false,
          users: users
        )
    );
  }
}