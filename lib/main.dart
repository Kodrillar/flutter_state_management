import 'package:flutter/material.dart';
import 'package:switch_settings/app_state_container.dart';
import 'package:switch_settings/auth_screen.dart';

void main() {
  runApp(const AppStateContainer(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
