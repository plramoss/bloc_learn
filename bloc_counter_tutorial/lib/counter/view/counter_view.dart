import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_counter_tutorial/counter/counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}

class CounterView extends StatelessWidget {
  const CounterView({super.key});
  
  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        // A BlocBuilder is used in order to update the text any time the CounterCubit state changes.
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state){
            return Text('$state', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // In addition, context.read<CounterCubit>() is used to look-up the closest CounterCubit instance.
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton(
              key: const Key('counterView_increment_floatActionButton'),
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment()
            ),
          ),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement()
          )
        ],
      ),
    );
  }
}