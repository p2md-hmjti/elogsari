import 'screens/opening.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Opening());
}

class ElogsariApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Opening(),
    );
  }
}
