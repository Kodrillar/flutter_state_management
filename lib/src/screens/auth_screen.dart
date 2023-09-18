import 'package:flutter/material.dart';
import 'package:switch_settings/src/app_state_container.dart';
import 'package:switch_settings/src/screens/account_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.title});

  final String title;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            ValueListenableBuilder(
              valueListenable: AppStateContainer.of(context).appStateNotifier,
              builder: (context, value, child) {
                print('AuthScreen TextField Widget Rebuilt.');
                return TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () => AppStateContainer.of(context)
                            .toggleTextFieldVisibility(),
                        icon: value.authState.obscurePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: value.authState.obscurePassword);
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              },
              child: const Text('Go to Acount Screen'),
            )
          ],
        ),
      ),
    );
  }
}
