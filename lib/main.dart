import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:templates/src/presentation/page/sign_in_page.dart';
import 'package:templates/src/presentation/provider/auth_provider.dart';

import 'src/presentation/page/error_page.dart';
import 'src/presentation/page/landing_page.dart';
import 'src/presentation/route/home_route.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginInfo(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginInfo = context.watch<LoginInfo>();
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        debugLogDiagnostics: true,
        redirect: (BuildContext context, GoRouterState state) {
          final loggingIn = state.fullPath == '/signin';
          if (!loginInfo.loggedIn) return loggingIn ? null : '/signin';

          // if the user is logged in but still on the login page, send them to
          // the home page
          if (loggingIn) return '/home';

          // no need to redirect at all
          return null;
        },
        routes: [
          GoRoute(path: '/', builder: (_, __) => const LandingPage()),
          GoRoute(path: '/signin', builder: (_, __) => const SignInPage()),
          ...home,
        ],
        errorBuilder: (context, state) => ErrorPage(error: state.error?.message ?? state.error.hashCode.toString()),
      ),
      title: 'Flutter Template',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
    );
  }
}
