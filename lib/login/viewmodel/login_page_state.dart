import '../model/user.dart';

class LoginPageState {
  final bool isLoading;
  final String name;
  final List<User> users;

//<editor-fold desc="Data Methods">

  const LoginPageState({
    required this.isLoading,
    required this.name,
    required this.users,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginPageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          name == other.name &&
          users == other.users);

  @override
  int get hashCode => isLoading.hashCode ^ name.hashCode ^ users.hashCode;

  @override
  String toString() {
    return 'LoginPageState{' +
        ' isLoading: $isLoading,' +
        ' name: $name,' +
        ' users: $users,' +
        '}';
  }

  LoginPageState copyWith({
    bool? isLoading,
    String? name,
    List<User>? users,
  }) {
    return LoginPageState(
      isLoading: isLoading ?? this.isLoading,
      name: name ?? this.name,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': this.isLoading,
      'name': this.name,
      'users': this.users,
    };
  }

  factory LoginPageState.fromMap(Map<String, dynamic> map) {
    return LoginPageState(
      isLoading: map['isLoading'] as bool,
      name: map['name'] as String,
      users: map['users'] as List<User>,
    );
  }

//</editor-fold>
}
