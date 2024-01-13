import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/authintication/data/models/api_login_input.dart';
import 'package:doctor/features/authintication/data/models/api_login_result.dart';
import 'package:doctor/features/authintication/data/models/api_register_input.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginUrl)
  Future<ApiAuthResult> login(
    @Body() ApiLoginInput input,
  );

  @POST(ApiConstants.registerUrl)
  Future<ApiAuthResult> register(
    @Body() ApiRegisterInput input,
  );
}
