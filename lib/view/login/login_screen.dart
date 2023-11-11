import 'package:chat_app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
            padding: EdgeInsets.fromLTRB(0, 1.h, 0, 3.h),
            child: Text(
              'Welcome to the best chat app ever!',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.2,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        hideForgotPasswordButton: true,
        theme: LoginTheme(
          pageColorDark: Colors.grey[800],
          pageColorLight: Colors.grey[800],
          primaryColor: Colors.indigo,
          accentColor: Colors.indigo,
          cardTheme: CardTheme(color: Colors.grey[300]),
          buttonTheme: LoginButtonTheme(splashColor: Colors.indigo[700]),
        ),
        onSignup: _register,
        onLogin: _login,
        passwordValidator: (value) => value==null || value.length<6? 'Password is too short!' : null,
        onRecoverPassword: (p0) => null,
        onSubmitAnimationCompleted: () => GoRouter.of(context).go('/home'),
        messages: LoginMessages(loginButton: 'Login', signupButton: 'Register'),
      ),
    );
  }

  Future<String?>? _login(loginData) async {
    final loginVM = Provider.of<LoginViewModel>(context, listen: false);
    final credentials =
        await loginVM.signIn(loginData.name, loginData.password);
    if (credentials == null) {
      return 'Wront email or password, Please try again!';
    } else {
      return null;
    }
  }

  Future<String?>? _register(registerData) async {
    final loginVM = Provider.of<LoginViewModel>(context, listen: false);
    final credentials =
        await loginVM.signUp(registerData.name, registerData.password);
    if (credentials == null) {
      return 'The email is being used! Please try to login';
    } else {
      return null;
    }
  }
}
