import 'package:flutter/material.dart';
import 'package:learn_bloc/app_routes.dart';

void main() {
  runApp( MyApp(router: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
   MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      onGenerateRoute:router.generateRoute ,

    );
  }
}

