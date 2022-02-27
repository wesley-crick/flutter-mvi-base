import 'package:flutter_demo_app/login/network/model/user_dto.dart';

class LoginPageState {
  final bool isLoading;
  final int counter;
  // TODO: dto's should be converted to view objects(VO)
  final List<UserDto> users;

//<editor-fold desc="Data Methods">

  const LoginPageState({
    required this.isLoading,
    required this.counter,
    required this.users,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginPageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          counter == other.counter &&
          users == other.users);

  @override
  int get hashCode => isLoading.hashCode ^ counter.hashCode ^ users.hashCode;

  @override
  String toString() {
    return 'LoginPageState{' +
        ' isLoading: $isLoading,' +
        ' counter: $counter,' +
        ' users: $users,' +
        '}';
  }

  LoginPageState copyWith({
    bool? isLoading,
    int? counter,
    List<UserDto>? users,
  }) {
    return LoginPageState(
      isLoading: isLoading ?? this.isLoading,
      counter: counter ?? this.counter,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': this.isLoading,
      'counter': this.counter,
      'users': this.users,
    };
  }

  factory LoginPageState.fromMap(Map<String, dynamic> map) {
    return LoginPageState(
      isLoading: map['isLoading'] as bool,
      counter: map['counter'] as int,
      users: map['users'] as List<UserDto>,
    );
  }

//</editor-fold>
}
