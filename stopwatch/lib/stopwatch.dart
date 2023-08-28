import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Timer? timer;
  int seconds = 0;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          _timerText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  String get _timerText => '$seconds ${seconds == 1 ? "second" : "seconds"}';

  void _onTick(_) {
    if (!mounted) return;
    setState(() {
      ++seconds;
    });
  }
}
