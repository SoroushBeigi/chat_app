import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _storageService = StorageService();

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<UserCredential?> signIn(String email, String password) async {
    final credentials = await _authService.signIn(email, password);
    if (credentials != null) {
      _storageService.setLoggedIn();
      return credentials;
    } else {
      return null;
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    _storageService.setLoggedIn();
    final credentials = await _authService.signUp(email, password);
    if (credentials != null) {
      _storageService.setLoggedIn();
      return credentials;
    } else {
      return null;
    }
  }

  Future<void> readLoginStatus() async {
    _loggedIn = await _storageService.readLoginStatus();
    notifyListeners();
  }
}
