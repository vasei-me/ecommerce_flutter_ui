import 'package:flutter/material.dart';

class FeatureNotAvailable extends StatelessWidget {
  const FeatureNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This feature is not available yet',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
