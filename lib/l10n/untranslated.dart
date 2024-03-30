import 'package:intl/intl.dart';

//HomePage / CounterApp

String counterText(int counter) => Intl.withLocale(
      "en",
      () => Intl.message(
        '''${Intl.plural(
          counter,
          zero: "You haven't pushed the button yet",
          other: "You have pushed the button this many times",
        )}''',
        name: 'counterText',
        args: [counter],
      ),
    );

String addBtnTooltip() =>
    Intl.withLocale("en", () => Intl.message("tooltip", name: 'addBtnTooltip'));

String counterAppTitle() => Intl.withLocale(
    "en", () => Intl.message("Counter", name: 'counterAppTitle'));
