import 'package:flutter/material.dart';
import 'package:switch_settings/src/app_state_container.dart';
import 'package:switch_settings/src/screens/auth_screen.dart';

void main() {
  runApp(const AppStateContainer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management with setState & Inherited Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(title: 'Auth Screen'),
    );
  }
}
