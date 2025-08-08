import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart';
import 'package:rohid_boilerplate/presentation/features/counter/states/counter_state.dart';
import 'package:rohid_boilerplate/presentation/features/counter/viewmodel/counter_viewmodel.dart';
import 'package:rohid_boilerplate/presentation/theme/app_text_styles.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterState viewModel = ref.watch(counterViewModelProvider);
    final CounterViewModel notifier = ref.read(
      counterViewModelProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: _buildBody(context, viewModel),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              notifier.decrement();
            },
            child: const Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              notifier.increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, CounterState viewModel) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The Count is',
            style: Theme.of(context).textTheme.titleLargeItalic.copyWith(
              fontSize: AppValues.dimen_16.sp,
            ),
          ),
          10.verticalSpace,
          Text('${viewModel.count}'),
        ],
      ),
    );
  }
}
