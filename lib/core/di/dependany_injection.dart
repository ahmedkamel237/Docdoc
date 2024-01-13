import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_service.dart';
import 'package:doctor/core/networking/dio_factory.dart';
import 'package:doctor/features/authintication/data/reposatory/login_reposatory.dart';
import 'package:doctor/features/authintication/data/reposatory/register_repository.dart';
import 'package:doctor/features/authintication/ui/pages/login/login_cubit.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepository(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
}
