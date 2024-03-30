import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/src/home/presentation/providers/counter_provider.dart';

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.watch(counterProvider);
    final counter = counterNotifier.counter;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('counterAppTitle'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(plural('pushedBtnText', 0), textAlign: TextAlign.center),
            Text(
              '${counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          counterNotifier.incrementCounter();
        },
        tooltip: 'tooltip'.tr(),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
