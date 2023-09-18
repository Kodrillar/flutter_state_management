import 'package:flutter/material.dart';
import 'package:switch_settings/src/app_state_container.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Screen'),
      ),
      body: ValueListenableBuilder(
          valueListenable: AppStateContainer.of(context).appStateNotifier,
          child: Center(
            child: ElevatedButton(
              child: const Text('Update TextField'),
              onPressed: () =>
                  AppStateContainer.of(context).updateUsername('Kodrillar'),
            ),
          ),
          builder: (context, value, child) {
            print('AccountScreen Widget Rebuilt.');

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.accountState.username ?? 'No data',
                ),
                const SizedBox(height: 50),
                child!
              ],
            );
          }),
    );
  }
}
