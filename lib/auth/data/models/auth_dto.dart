import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDto {
  final String id;
  final String? email;
  final String? name;
  final bool? isAnonymous;

  AuthDto({
    required this.id,
    required this.email,
    required this.name,
    required this.isAnonymous,
  });
  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  factory AuthDto.fromFirebaseUser(User? firebaseUser) {
    final String idUser = firebaseUser?.uid ?? '';
    return AuthDto(
      id: idUser,
      email: firebaseUser?.email,
      name: firebaseUser?.displayName,
      isAnonymous: firebaseUser?.isAnonymous,
    );
  }
}
