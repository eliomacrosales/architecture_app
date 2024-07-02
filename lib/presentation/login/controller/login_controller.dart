import 'package:architecture/config/environment/environment.dart';
import 'package:architecture/core/constants/app_routes.dart';
import 'package:architecture/core/error_handler/app_exception.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:architecture/core/dependency_injection/repository_provider/repository_provider.dart';
import 'package:flutter/material.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  late final RepositoryInterface _repository;

  @override
  Future<void> build() async {
    _repository = ref.read(repositoryProvider);
  }

  Future<void> login({required String user, required String password, required BuildContext context}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
          () async {
        final token = await _repository.login(
          username: user,
          password: password,
          grantType: 'password',
          clientId: Environment.clientID,
          clientSecret: Environment.clientSecret,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', 'Bearer ${token.accessToken}');
        _repository.updateDioHeaders({"Authorization": 'Bearer ${token.accessToken}'});
        _repository.updateBaseURL(Environment.baseUrlApp);

        context.goNamed(AppRoutes.home);  // Navegación al home después de un login exitoso
      },
          (err) => err is! AppException,
    );
  }
}
