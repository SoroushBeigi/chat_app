import 'package:chat_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  final _authService = AuthService();

  Future<UserCredential?> signIn(String email, String password) =>
      _authService.signIn(email, password);

  Future<UserCredential?> signUp(String email, String password) =>
      _authService.signUp(email, password);
}
