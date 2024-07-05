import 'package:architecture/core/networking/api_response.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  late final RepositoryInterface _repository;
  APIResponse<User>? user;

  HomeController(RepositoryInterface repository) {
    _repository = repository;
  }

  Future<APIResponse<User>> fetchUser() async {
    isLoading = true;
    notifyListeners();

    user = await _repository.fetchUser();
    nameController.text = user?.data?.fullName ?? "";

    isLoading = false;
    notifyListeners();
    return user!;
  }

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      user?.data?.fullName = nameController.text;
      print(user?.data?.toJson());
    }
  }

  void disposeResources() {
    isLoading = true;
  }
}
