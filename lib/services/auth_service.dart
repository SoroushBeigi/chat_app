import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _fireBaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _fireBaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      return null;
    }
  }
}
