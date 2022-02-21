class LoginPageState {
  final bool isLoading;
  final int counter;

//<editor-fold desc="Data Methods">

  const LoginPageState({
    required this.isLoading,
    required this.counter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginPageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          counter == other.counter);

  @override
  int get hashCode => isLoading.hashCode ^ counter.hashCode;

  @override
  String toString() {
    return 'LoginPageState{' +
        ' isLoading: $isLoading,' +
        ' counter: $counter,' +
        '}';
  }

  LoginPageState copyWith({
    bool? isLoading,
    int? counter,
  }) {
    return LoginPageState(
      isLoading: isLoading ?? this.isLoading,
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': this.isLoading,
      'counter': this.counter,
    };
  }

  factory LoginPageState.fromMap(Map<String, dynamic> map) {
    return LoginPageState(
      isLoading: map['isLoading'] as bool,
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
