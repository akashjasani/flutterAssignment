import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeventsapp/routes/route_constant.dart';
import 'package:myeventsapp/routes/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          hintColor: Colors.purpleAccent,
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: eventRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
