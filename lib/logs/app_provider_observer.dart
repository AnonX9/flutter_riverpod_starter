import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A custom [ProviderObserver] implementation that logs provider-related events using [Talker].
///
/// This class overrides the necessary methods from [ProviderObserver] to log
/// information about providers when they are added, updated, or disposed.
class AppProviderObserver extends ProviderObserver {
  /// Creates an [AppProviderObserver] with the specified [Talker] instance.
  ///
  /// The [talker] parameter is the instance of [Talker] used to log messages.
  const AppProviderObserver(this._talker);

  // The instance of Talker used to log messages.
  final Talker _talker;

  @override

  /// Logs when a provider is added.
  ///
  /// This method is called when a provider is added to the [ProviderContainer].
  /// It logs the provider that was added and its initial value.
  ///
  /// The [provider] parameter is the provider that was added.
  /// The [value] parameter is the initial value of the provider.
  /// The [container] parameter is the [ProviderContainer] in which the provider is added.
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    // Logs when a provider is added.
    _talker.verbose(
      // Log the provider that was added.
      '$provider has been created\n'
      // Log the initial value of the provider.
      '\tInitial value:\n'
      '\t\t$value',
    );
  }

  @override

  /// Logs when a provider throws an exception.
  ///
  /// This method is called when a provider throws an exception.
  /// It logs the provider that raised the exception, the exception itself,
  /// and the stack trace.
  ///
  /// The [provider] parameter is the provider that raised the exception.
  /// The [error] parameter is the exception that was thrown.
  /// The [stackTrace] parameter is the stack trace of the exception.
  /// The [container] parameter is the [ProviderContainer] in which the provider is added.
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    // Logs when a provider throws an exception.
    _talker.handle(
      error, // The exception that was thrown.
      stackTrace, // The stack trace of the exception.
      '$provider raised an Exception\n', // The log message.
    );
  }

  @override

  /// Logs when a provider's value is updated.
  ///
  /// This method is called when a provider's value is updated.
  /// It logs the provider that was updated, the previous value, and the new value.
  ///
  /// The [provider] parameter is the provider that was updated.
  /// The [previousValue] parameter is the previous value of the provider.
  /// The [newValue] parameter is the new value of the provider.
  /// The [container] parameter is the [ProviderContainer] in which the provider is added.
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // Logs when a provider's value is updated.
    _talker.verbose(
      '$provider updated\n'
      '\tOld value:\n'
      '\t\t$previousValue\n'
      '\tNew value:\n'
      '\t\t$newValue',
    );
  }

  @override

  /// Logs when a provider is disposed.
  ///
  /// This method is called when a provider is disposed.
  /// It logs the provider that was disposed.
  ///
  /// The [provider] parameter is the provider that was disposed.
  /// The [container] parameter is the [ProviderContainer] in which the provider was added.
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    // Logs when a provider is disposed.
    _talker.verbose(
      // Log the provider that was disposed.
      '$provider has been disposed',
    );
  }
}
