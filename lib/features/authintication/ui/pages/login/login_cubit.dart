import 'package:doctor/features/authintication/data/models/api_login_input.dart';
import 'package:doctor/features/authintication/data/reposatory/login_reposatory.dart';
import 'package:doctor/features/authintication/ui/pages/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(const LoginState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(ApiLoginInput input) async {
    emit(const LoginState.loading());
    final response = await _loginRepository.login(input);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error));
    });
  }
}
