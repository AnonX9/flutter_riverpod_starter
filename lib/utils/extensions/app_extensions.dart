import 'package:flutter/material.dart';

/// Extensions for [num] that provide convenient access to [SizedBox] widgets.
///
/// The [SizedBox] widget is used to constrain the size of a child widget.
/// This extension provides easy access to [SizedBox] widgets by providing
/// properties for setting the height and width of the widget.
///
/// Example usage:
///
/// ```dart
/// 100.height;
/// 100.width;
/// ```
///
extension SizedBoxExtention on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
