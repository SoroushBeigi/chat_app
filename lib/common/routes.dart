import 'package:chat_app/view/chat/chat_screen.dart';
import 'package:chat_app/view/home/home_screen.dart';
import 'package:chat_app/view/login/login_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter config(bool isLoggedIn) => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                isLoggedIn ? const HomeScreen() : const LoginScreen(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/home/chat',
            name: 'chat',
            builder: (context, state) => ChatScreen(
              email: state.uri.queryParameters['email']!,
              id: state.uri.queryParameters['id']!,
            ),
          ),
        ],
      );
}
