abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String errMsg;
  LoginErrorState({required this.errMsg});
}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String errMsg;
  SignUpErrorState({required this.errMsg});
}
