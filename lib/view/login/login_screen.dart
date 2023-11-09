import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
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
            padding: EdgeInsets.fromLTRB(0,1.h,0,3.h),
            child: Text(
              'Welcome to the best chat app ever!',
              style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 15.5.sp,
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
        
        onSignup: (p0) => null,
        onLogin: (p0){
          final loginVM = Provider.of<LoginViewModel>(context,listen: false);
          try{
            print(p0.name);
            print(p0.password);
            // loginVM.signIn(p0., password)
          }catch(e){

          }
        },
        onRecoverPassword: (p0) => null,
        onSubmitAnimationCompleted: () {},
        messages: LoginMessages(loginButton: 'Login', signupButton: 'Register'),
      ),
    );
  }
}
