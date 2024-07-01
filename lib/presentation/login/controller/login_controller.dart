import 'package:architecture/config/environment/environment.dart';
import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/token/token.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;

  late final RepositoryInterface _repository;
  late SharedPreferences prefs;

  LoginController(RepositoryInterface repository) {
    _repository = repository;
  }

 Future<APIResponse<Token>> login({required String user, required String password}) async {
    isLoading = true;
    notifyListeners();

    final token = await _repository.login(
      username: user,
      password: password,
      grantType: 'password',
      clientId: Environment.clientID,
      clientSecret: Environment.clientSecret,
    );

    if(!token.error){
      prefs = await SharedPreferences.getInstance();
      prefs.setString('token', 'Bearer ${token.data!.accessToken}');
      _repository.updateDioHeaders({"Authorization":'Bearer ${token.data!.accessToken}'});
      _repository.updateBaseURL(Environment.baseUrlApp);
    }

    isLoading = false;
    notifyListeners();
    return token;
  }

  void disposeResources() {
    isLoading = false;
  }
}
