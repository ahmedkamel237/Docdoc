import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_login_input.g.dart';

@JsonSerializable()
class ApiLoginInput {
  final String email;
  final String password;

  ApiLoginInput({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$ApiLoginInputToJson(this);
}
