import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _fireBaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _fireBaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
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
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException {
      return null;
    }
  }
}
