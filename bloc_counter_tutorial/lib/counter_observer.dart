import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class CounterObserver extends BlocObserver {
  // {@macro counter_observer}
  const CounterObserver();

  /// {@template counter_observer}
  /// [BlocObserver] for the counter application which
  /// observes all state changes.
  /// {@endtemplate}

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // 'bloc' is the instance of BlocBase where the state change occoured
    // 'change' is an object that contains the current and next state
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }
}