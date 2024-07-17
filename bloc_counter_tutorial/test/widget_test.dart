import 'package:bloc_counter_tutorial/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() async {
      await counterCubit.close();
    });

    blocTest<CounterCubit, int>('emits [] when nothing is added',
      build: () => counterCubit,
      expect: () => [],
    );

    blocTest<CounterCubit, int>('emits [1] when incremented',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [1]
    );

    blocTest<CounterCubit, int>('emits [-1] when decremented',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [-1]
    );

    blocTest<CounterCubit, int>('emits [1, 2] when incremented twice',
      build: () => counterCubit,
      act: (cubit) => cubit..increment()..increment(),
      expect: () => [1, 2]
    );

    blocTest<CounterCubit, int>('emits [1, 0] when incremented and then decremented',
      build: () => counterCubit,
      act: (cubit) => cubit..increment()..decrement(),
      expect: () => [1, 0]
    );

    blocTest<CounterCubit, int>('emits multiple states when incremented and decremented multiple times',
        build: () => counterCubit,
        act: (cubit) => cubit..increment()..increment()..decrement()..increment(),
        expect: () => [1, 2, 1, 2]
    );
  });
}