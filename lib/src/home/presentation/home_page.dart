import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starter/src/home/presentation/providers/counter_provider.dart';
import 'package:flutter_riverpod_starter/utils/extensions/app_extensions.dart';

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.watch(counterProvider);
    final counter = counterNotifier.counter;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.L.counterAppTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.L.counterText(counter)),
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
        tooltip: context.L.addBtnTooltip,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
