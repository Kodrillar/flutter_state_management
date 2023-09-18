# flutter_state_management

A new Flutter project demonstrating how to manage state with `setState`, `InheritedWidget` and `Stream` to watch out for changes in global state ;

# Overview

The `AppStateContainer` holds all the possible states that exist in the app. This widget should be mounted at the top-most part of the widget tree as it wraps its child with an `InheritedWidget` that can be used to obtain the app's state in every descendant.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
