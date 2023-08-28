import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Timer? timer;
  int milliseconds = 0;
  bool isTicking = false;
  final laps = <int>[];

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
          Expanded(child: _buildCounterAndControls(context)),
          Expanded(child: _buildLapDisplay(context)),
        ],
      ),
    );
  }

  Widget _buildCounterAndControls(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCounter(context),
          const SizedBox(height: 20),
          _buildControls(context),
        ],
      ),
    );
  }

  Widget _buildLapDisplay(BuildContext context) {
    return ListView(
      children: [
        for (int milliseconds in laps)
          ListTile(title: Text(_secondsText(milliseconds))),
      ],
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Lap ${laps.length + 1}',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
        Text(
          _secondsText(milliseconds),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text('Start'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
          ),
          onPressed: isTicking ? _lap : null,
          child: const Text('Lap'),
        ),
        const SizedBox(width: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? _stopTimer : null,
          child: const Text('End'),
        ),
      ],
    );
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      milliseconds = 0;
      laps.clear();
    });
  }

  void _stopTimer() {
    timer?.cancel();
    timer = null;

    setState(() {
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  void _onTick(_) {
    setState(() {
      milliseconds += 100;
    });
  }

  String _secondsText(int milliseconds) => '${milliseconds / 1000} seconds';
}
