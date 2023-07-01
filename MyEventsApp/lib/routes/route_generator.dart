import 'package:flutter/material.dart';
import 'package:myeventsapp/routes/route_constant.dart';

import '../screens/event_detail_screen.dart';
import '../screens/event_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case eventRoute:
        return MaterialPageRoute(builder: (_) => const EventListScreen());
      case eventDetailRoute:
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => EventDetailScreen(id: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
