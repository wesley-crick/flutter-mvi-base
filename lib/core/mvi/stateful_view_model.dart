import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

abstract class StatefulViewModel<State, Action>
    extends GetxController with UiLoggy {

  State _state;
  State get state => _state;

  Rx<Action?> action = Rx<Action?>(null);

  StatefulViewModel(this._state) {
    _listenForAction();
  }

  void _listenForAction() {
    action.listen((a) {
      if(a != null) {
        loggy.debug("Reducing ${a.runtimeType}");
        reduce(a);
        update();
      }
    });
  }

  void send(Action action) {
    this.action.value = action;
  }

  void updateState(State state) {
    loggy.debug("Previous state: $_state");
    _state = state;
    loggy.debug("Updated state: $_state");
  }

  /// Implement a switch case for parsing actions sent to your view model.
  void reduce(Action action);
}