import 'package:bloc/bloc.dart';
import 'package:contracts/core/bloc/bloc_observer.dart';
import 'package:contracts/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import 'di.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
