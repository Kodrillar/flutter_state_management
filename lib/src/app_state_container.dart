import 'package:flutter/material.dart';
import 'package:switch_settings/src/app_state.dart';

class _AppStateInheritedWidget extends InheritedWidget {
  const _AppStateInheritedWidget({
    required super.child,
    required this.state,
  });

  final AppStateContainerState state;

  @override
  bool updateShouldNotify(_AppStateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}

class AppStateContainer extends StatefulWidget {
  const AppStateContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  static AppStateContainerState of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<_AppStateInheritedWidget>()!.state;

  @override
  State<AppStateContainer> createState() => AppStateContainerState();
}

/// State class made public for typed access.
/// Only one instance will be created by StatefulWidget's createState() method. ;
class AppStateContainerState extends State<AppStateContainer> {
  late var appStateNotifier = ValueNotifier(AppState());

  void toggleTextFieldVisibility() {
    appStateNotifier.value = appStateNotifier.value.copyWith(
      authState: appStateNotifier.value.authState.copyWith(
        obscurePassword: !appStateNotifier.value.authState.obscurePassword,
      ),
    );
  }

  void updateUsername(String username) {
    appStateNotifier.value = appStateNotifier.value.copyWith(
      accountState:
          appStateNotifier.value.accountState.copyWith(username: username),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateInheritedWidget(
      state: this,
      child: widget.child,
    );
  }
}
