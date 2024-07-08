import 'package:architecture/core/dependency_injection/repository_provider/repository_provider.dart';
import 'package:architecture/domain/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_controller.g.dart';

@Riverpod(keepAlive: true)
class DetailController extends _$DetailController {
  @override
  Future<User> build() async {
    return ref.read(repositoryProvider).fetchUser();
  }
}
