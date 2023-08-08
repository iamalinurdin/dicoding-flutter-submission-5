import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/data/storages/user_storage.dart';
import 'package:submission_5_story_app/providers/auth_provider.dart';
import 'package:submission_5_story_app/providers/story_provider.dart';
import 'package:submission_5_story_app/screens/home_screen.dart';
import 'package:submission_5_story_app/screens/login_screen.dart';
import 'package:submission_5_story_app/screens/posting_screen.dart';
import 'package:submission_5_story_app/screens/register_screen.dart';
import 'package:submission_5_story_app/providers/file_provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  // redirect: (context, state) {
  //   return '/';
  // },
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(title: 'Title'),
    ),
    GoRoute(
      path: '/posting',
      builder: (context, state) => const PostingScreen(),
    ),
  ],
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FileProvider()
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            userStorage: UserStorage()
          )
        ),
        ChangeNotifierProvider(
          create: (_) => StoryProvider()
        )
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      // routeInformationParser: _router.routeInformationParser,
      // routeInformationProvider: _router.routeInformationProvider,
      // routerDelegate: _router.routerDelegate,
    );
  }
}