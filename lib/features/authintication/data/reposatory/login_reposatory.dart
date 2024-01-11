import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/features/authintication/data/models/api_login_input.dart';
import 'package:doctor/features/authintication/data/models/api_login_result.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<ApiLoginResult>> login(
      ApiLoginInput input) async {
    try {
      final response = await _apiService.login(input);
      return ApiResult.success(response);
    } catch (e) {
      // TODO:ErrorHandler.
      return ApiResult.failure(e.toString());
    }
  }
}