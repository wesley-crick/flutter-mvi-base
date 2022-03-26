import 'package:flutter_demo_app/login/network/model/user_dto.dart';

import '../model/user.dart';

class LoginPageState {
  final bool isLoading;
  final int counter;
  // TODO: dto's should be converted to view objects(VO)
  final User? user;

//<editor-fold desc="Data Methods">

  const LoginPageState({
    required this.isLoading,
    required this.counter,
    required this.user,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginPageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          counter == other.counter &&
          user == other.user);

  @override
  int get hashCode => isLoading.hashCode ^ counter.hashCode ^ user.hashCode;

  @override
  String toString() {
    return 'LoginPageState{' +
        ' isLoading: $isLoading,' +
        ' counter: $counter,' +
        ' user: $user,' +
        '}';
  }

  LoginPageState copyWith({
    bool? isLoading,
    int? counter,
    User? user,
  }) {
    return LoginPageState(
      isLoading: isLoading ?? this.isLoading,
      counter: counter ?? this.counter,
      user: user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': this.isLoading,
      'counter': this.counter,
      'users': this.user,
    };
  }

  factory LoginPageState.fromMap(Map<String, dynamic> map) {
    return LoginPageState(
      isLoading: map['isLoading'] as bool,
      counter: map['counter'] as int,
      user: map['user'] as User,
    );
  }

//</editor-fold>
}
