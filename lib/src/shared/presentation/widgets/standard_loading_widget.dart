import 'package:flutter/material.dart';

/// A standard loading widget to display when content is loading.
class StandardLoadingWidget extends StatelessWidget {
  const StandardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(), // Display a circular progress indicator
          SizedBox(
              height:
                  12), // Add some space between the progress indicator and the text
          Text('Loading...'), // Display the loading text
        ],
      ),
    );
  }
}
