import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_academy/features/auth/presentation/cubit/auth_cubit/auth_states.dart';
import '../../../data/repo/auth_repo/auth_repo.dart';
class AuthCubit extends Cubit<AuthState>{
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitialState());

  signin({
    required String email,
    required String password
}) async {
    emit(LoginLoadingState());
    final response = await authRepo.signin(
        email: email,
        password: password);
    response.fold(
        (error){
          emit(LoginErrorState(errMsg: error.toString()));
        },
        (success){
          emit(LoginSuccessState());
        });
  }
  signup({
    required String email,
    required String password,
    required String name
}) async {
    emit(SignUpLoadingState());
    final response = await authRepo.signup(
        email: email, password: password, name: name);
    response.fold((error){
      emit(SignUpErrorState(errMsg: error.toString()));
    }, (success){
      emit(SignUpSuccessState());
    });
  }
}