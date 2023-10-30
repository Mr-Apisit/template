import 'package:go_router/go_router.dart';

import '../page/home_page.dart';

final List<RouteBase> home = [
  GoRoute(
    path: '/home',
    builder: (context, _) => const HomePage(),
  ),
];
