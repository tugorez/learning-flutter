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
  bool isTicking = false;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _timerText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Start'),
                onPressed: isTicking ? null : _startTimer,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                child: const Text('End'),
                onPressed: isTicking ? _stopTimer : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get _timerText => '$seconds ${seconds == 1 ? "second" : "seconds"}';

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);

    setState(() {
      isTicking = true;
      seconds = 0;
    });
  }

  void _stopTimer() {
    timer?.cancel();
    timer = null;

    setState(() {
      isTicking = false;
    });
  }

  void _onTick(_) {
    setState(() {
      ++seconds;
    });
  }
}
