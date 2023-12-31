class AppState {
  AppState({
    this.accountState = const AccountState(),
    this.authState = const AuthState(),
  });
  final AuthState authState;
  final AccountState accountState;

  AppState copyWith({
    AccountState? accountState,
    AuthState? authState,
  }) {
    return AppState(
      accountState: accountState ?? this.accountState,
      authState: authState ?? this.authState,
    );
  }

  @override
  String toString() =>
      'AppState(authState: $authState, accountState: $accountState)';
}

class BaseStateNotification<T> {
  const BaseStateNotification();
  // Checks if newly emitted value is different.
  ///
  /// This returns false if
  /// newly emitted value is the same as current value.
  /// If newly emitted value is different, this returns true;
  bool updateShouldNotify(T state) => state != this;
}

class AuthState extends BaseStateNotification<AuthState> {
  final bool obscurePassword;

  const AuthState({this.obscurePassword = false});

  AuthState copyWith({bool? obscurePassword}) =>
      AuthState(obscurePassword: obscurePassword ?? this.obscurePassword);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState && other.obscurePassword == obscurePassword;
  }

  @override
  int get hashCode => obscurePassword.hashCode;

  @override
  String toString() => 'AuthState(obscurePassword: $obscurePassword)';
}

class AccountState extends BaseStateNotification<AccountState> {
  const AccountState({this.username});
  final String? username;

  AccountState copyWith({String? username}) =>
      AccountState(username: username ?? this.username);

  @override
  String toString() => 'AccountState(username: $username)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountState && other.username == username;
  }

  @override
  int get hashCode => username.hashCode;
}
