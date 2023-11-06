import 'package:go_router/go_router.dart';

import '../page/event_page/event_page.dart';

final List<RouteBase> event = [
  GoRoute(
    path: '/event',
    builder: (_, __) => const EventPage(),
  ),
];
