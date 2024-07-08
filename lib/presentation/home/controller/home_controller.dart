import 'package:architecture/core/dependency_injection/repository_provider/repository_provider.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';


final reloadUser = StateProvider<bool>((ref) => false);

@Riverpod(keepAlive: false)
class HomeController extends _$HomeController {
  @override
  Future<User> build() async {
    return ref.read(repositoryProvider).fetchUser();
  }

  Future<void> refreshUser() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(repositoryProvider).fetchUser());
  }

}
