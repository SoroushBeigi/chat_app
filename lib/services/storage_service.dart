
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService{
  final _storage = const FlutterSecureStorage();

  Future<void> setLoggedIn() async {
    await _storage.write(key: 'isLoggedIn', value: 'true');
  }

  Future<bool> readLoginStatus() async {
    final status = await _storage.read(key: 'isLoggedIn');
    final loginStatus = (status == 'true') ? true : false;
    return loginStatus;
  }
}