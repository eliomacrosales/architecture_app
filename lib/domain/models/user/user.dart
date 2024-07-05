import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class User with _$User {
  factory User({required String fullName}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
