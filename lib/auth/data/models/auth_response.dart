import 'package:auth_module/auth/data/models/auth_dto.dart';

class AuthResponse {
  final AuthDto? authDto;
  final String? firebaseError;
  final String? catchError;
  final bool? isLogged;

  AuthResponse({
    required this.authDto,
    required this.firebaseError,
    required this.catchError,
    required this.isLogged,
  });
}
