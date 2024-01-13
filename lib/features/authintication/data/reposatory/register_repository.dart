import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/features/authintication/data/models/api_login_result.dart';
import 'package:doctor/features/authintication/data/models/api_register_input.dart';

class RegisterRepository {
  final ApiService _apiService;

  RegisterRepository(this._apiService);

  Future<ApiResult<ApiAuthResult>> register(
      ApiRegisterInput input) async {
    try {
      final response = await _apiService.register(input);
      return ApiResult.success(response);
    } catch (e) {
      // TODO:ErrorHandler.
      return ApiResult.failure(e.toString());
    }
  }
}