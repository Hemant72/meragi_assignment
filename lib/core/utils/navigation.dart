import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:meragi_assignment/src/auth/presentation/pages/login_page.dart';
import 'package:meragi_assignment/src/home/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser == null ? '/' : '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
