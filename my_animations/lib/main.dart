import 'package:flutter/material.dart';
import 'package:my_animations/animations_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationsView(),
    );
  }
}
