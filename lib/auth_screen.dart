import 'dart:async';

import 'package:flutter/material.dart';
import 'package:switch_settings/account_screen.dart';
import 'package:switch_settings/app_state.dart';
import 'package:switch_settings/app_state_container.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.title});

  final String title;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late StreamSubscription<AppState> _appStateSub;

  @override
  void dispose() {
    super.dispose();
    _appStateSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = AppStateContainer.of(context).appState.authState;

    _appStateSub = AppStateContainer.of(context).appStateChanges.listen(
      (newState) {
        /// By using [updateShouldNotify], you'll prevent uncessary rebuild for
        /// changes from other states that are not needed.
        ///
        /// For example, the state changes for [AccountState] made from the [AccountScreen]
        /// isn't needed on the [AuthScreen], so we have to check for only the changes that
        /// occured for the currently used state (AuthState).
        if (authState.updateShouldNotify(newState.authState) && mounted) {
          setState(() {
            authState = newState.authState;
          });
        }
      },
    );

    print('AuthScreen Rebuilt.');

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
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    AppStateContainer.of(context).toggleTextFieldVisibility();
                  },
                  icon: authState.obscurePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
              obscureText: authState.obscurePassword,
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
