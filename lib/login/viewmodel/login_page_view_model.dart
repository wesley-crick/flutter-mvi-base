import '../../core/mvi/stateful_view_model.dart';
import 'login_page_action.dart';
import 'login_page_state.dart';

class LoginPageViewModel
    extends StatefulViewModel<LoginPageState, LoginPageAction> {

  LoginPageViewModel(): super(
      const LoginPageState(
        isLoading: false,
        counter: 0
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
      }
  }

  void _reduceOnEnterClicked() {
    updateState(
        state.copyWith(
          isLoading: true,
          counter: state.counter + 1
        )
    );
  }

  void _reduceReset() {
    updateState(
        state.copyWith(
            isLoading: false
        )
    );
  }
}