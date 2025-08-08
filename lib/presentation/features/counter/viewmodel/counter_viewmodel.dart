import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rohid_boilerplate/presentation/features/counter/states/counter_state.dart';

part 'counter_viewmodel.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  @override
  CounterState build() {
    return const CounterState();
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrement() {
    final int count = state.count;
    if (count > 0) {
      state = state.copyWith(count: state.count - 1);
    }
  }
}
