import 'dart:async';

import 'package:flutter/material.dart';
import 'package:switch_settings/src/app_state.dart';
import 'package:switch_settings/src/app_state_container.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late StreamSubscription<AppState> _appStateSub;

  @override
  void dispose() {
    super.dispose();
    _appStateSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AccountState accountState =
        AppStateContainer.of(context).appState.accountState;

    _appStateSub =
        AppStateContainer.of(context).appStateChanges.listen((appState) {
      if (accountState.updateShouldNotify(appState.accountState) && mounted) {
        setState(() {
          accountState = appState.accountState;
        });
      }
    });

    print('Account Screen Rebuilt.');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStateContainer.of(context).appState.accountState.username ??
                'No data',
          ),
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              child: const Text('Update TextField'),
              onPressed: () {
                AppStateContainer.of(context).updateUsername('Kodrillar');
              },
            ),
          ),
        ],
      ),
    );
  }
}
