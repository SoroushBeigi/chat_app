import 'package:chat_app/view/chat/chat_screen.dart';
import 'package:chat_app/view/home/home_screen.dart';
import 'package:chat_app/view/login/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Routes {
  static GoRouter config(bool isLoggedIn) => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => ResponsiveSizer(
              builder: (context, orientation, screenType) =>
                  isLoggedIn ? const HomeScreen() : const LoginScreen(),
            ),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => ResponsiveSizer(
              builder: (context, orientation, screenType) => const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/chat',
            name: 'chat',
            builder: (context, state) => ResponsiveSizer(
              builder: (context, orientation, screenType) => ChatScreen(
               email: state.uri.queryParameters['email']!,
               id: state.uri.queryParameters['id']!,
              ),
            ),
          ),
        ],
      );
}
