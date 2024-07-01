import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = true;

  late final RepositoryInterface _repository;
  APIResponse<User>? user;

  HomeController(RepositoryInterface repository) {
    _repository = repository;
  }

  Future<APIResponse<User>> fetchUser() async {
    isLoading = true;
    notifyListeners();

    user = await _repository.fetchUser();

    isLoading = false;
    notifyListeners();
    return user!;
  }

  void disposeResources() {
    isLoading = true;
  }
}
