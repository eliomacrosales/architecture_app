import 'package:architecture/core/dependency_injection/repository_provider/repository_provider.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<User> build() async {
    return ref.read(repositoryProvider).fetchUser();
  }
}
