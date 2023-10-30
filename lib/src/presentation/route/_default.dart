import 'package:go_router/go_router.dart';

import '../page/landing_page.dart';
import 'home_route.dart';

// GoRouter configuration
final List<RouteBase> routes = [
  GoRoute(path: '/', builder: (context, _) => const LandingPage())
];

final _router = GoRouter(
  initialLocation: '/',
  routes: routes
    ..addAll(home)
    ..addAll([]),
);

GoRouter get router  => _router;
