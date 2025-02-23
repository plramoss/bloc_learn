import 'package:flutter/material.dart';
import 'package:bloc_counter_tutorial/counter/counter.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}

class CounterApp extends MaterialApp {
  // {@macro counter_app}
  /// We are extending MaterialApp because CounterApp is a MaterialApp.
  /// In most cases, we’re going to be creating StatelessWidget or StatefulWidget instances
  /// and composing widgets in build but in this case there are no widgets to compose so it’s simpler to just extend MaterialApp.
  const CounterApp({super.key}) : super(home: const CounterPage());
}