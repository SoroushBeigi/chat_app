import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: FlutterLogin(
        headerWidget: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Text(
              'Welcome to the best chat app ever!',
              style: TextStyle(
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
        hideForgotPasswordButton: true,
        theme: LoginTheme(
          pageColorDark: Colors.grey[800],
          pageColorLight: Colors.grey[800],
          primaryColor: Colors.amber,
          cardTheme: CardTheme(color: Colors.grey[300]),
          buttonTheme: LoginButtonTheme(splashColor: Colors.amber[700]),
        ),
        onLogin: (p0) => null,
        onRecoverPassword: (p0) => null,
        onSubmitAnimationCompleted: () {},
      ),
    );
  }
}
