import 'package:chat_app/common/routes.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/view_model/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //----------------------------------------------------
  //Replace with your own firebase options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //----------------------------------------------------
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginViewModel()..readLoginStatus(),
      child: const ChatApp(),
    ),
  );
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) => MaterialApp.router(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: Routes.config(loginViewModel.loggedIn),
        ),
      ),
    );
  }
}
