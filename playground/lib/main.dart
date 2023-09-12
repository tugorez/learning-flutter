import 'package:flutter/material.dart';
import 'package:playground/gap.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Columns(),
        ),
      ),
    );
  }
}

class Columns extends StatefulWidget {
  const Columns({super.key});

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  double gap = 0;

  @override
  void initState() {
    super.initState();
    _increaseGap();
  }

  Future<void> _increaseGap() async {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(seconds: i));
      setState(() {
        gap += 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Column 1'),
        Gap(gap),
        const Text('Column 2'),
        Gap(gap),
        const Text('Column 3'),
      ],
    );
  }
}
