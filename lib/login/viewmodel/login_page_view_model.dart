import 'package:flutter_demo_app/core/database/object_box.dart';
import 'package:flutter_demo_app/login/network/login_rest_client.dart';
import 'package:flutter_demo_app/login/repository/user_repository.dart';
import 'package:get/get.dart';

import '../../core/mvi/stateful_view_model.dart';
import '../database/user_dao.dart';
import '../model/user.dart';
import '../network/model/user_dto.dart';
import 'login_page_action.dart';
import 'login_page_state.dart';

class LoginPageViewModel
    extends StatefulViewModel<LoginPageState, LoginPageAction> {

  final UserRepository _userRepository = Get.find();

  LoginPageViewModel(): super(
      const LoginPageState(
        isLoading: false,
        counter: 0,
        user: null
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
        case UserLoaded:
          _reduceUserLoaded((action as UserLoaded).user);
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

    _userRepository.getUser().listen((user) {
      send(UserLoaded(user));
    });
  }

  void _reduceReset() {
    updateState(
        state.copyWith(
          isLoading: false,
          user: null
        )
    );
  }

  void _reduceUserLoaded(User user) {
    updateState(
        state.copyWith(
          isLoading: false,
          user: user
        )
    );
  }
}