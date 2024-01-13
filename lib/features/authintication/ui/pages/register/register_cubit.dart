import 'package:doctor/features/authintication/data/models/api_register_input.dart';
import 'package:doctor/features/authintication/data/reposatory/register_repository.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _registerRepository;
  RegisterCubit(this._registerRepository) : super(const RegisterState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(ApiRegisterInput input) async {
    emit(const RegisterState.loading());
    final response = await _registerRepository.register(input);
    response.when(success: (registerResponse) {
      emit(RegisterState.success(registerResponse));
    }, failure: (error) {
      emit(RegisterState.error(error: error));
    });
  }
}
