import 'package:flutter/material.dart';

class AnimationsView extends StatefulWidget {
  const AnimationsView({super.key});

  @override
  State<AnimationsView> createState() => _AnimationsViewState();
}

class _AnimationsViewState extends State<AnimationsView> {
  int iteration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
        actions: [
          IconButton(
            icon: const Icon(Icons.run_circle),
            onPressed: () {
              setState(() {
                iteration = (iteration + 1) % colors.length;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: sizes[iteration],
          height: sizes[iteration],
          margin: EdgeInsets.only(top: tops[iteration]),
          color: colors[iteration],
        ),
      ),
    );
  }

  static const colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange
  ];

  static const sizes = <double>[
    100,
    125,
    150,
    175,
    200,
  ];

  static const tops = <double>[
    0,
    50,
    100,
    150,
    200,
  ];
}
