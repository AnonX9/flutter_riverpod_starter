import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ChangeNotifier class to manage the counter state
class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

// Provider for the CounterNotifier class
final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());
