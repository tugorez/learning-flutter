import 'package:flutter/material.dart';

void main() {
  runApp(const HelloGesturesApp());
}

class HelloGesturesApp extends StatelessWidget {
  const HelloGesturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: animatedBox(),
      ),
    );
  }

  double _right = 0;

  void _onTapped() => setState(() => _right = 100);

  Widget animatedBox() {
    const sideLength = 200.0;

    return Container(
      height: sideLength,
      width: sideLength,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _right += 10;
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            _right = 0;
          });
        },
        child: Stack(
          children: [
            Material(color: Colors.grey, child: InkWell(onTap: _onTapped)),
            AnimatedPositioned(
              top: 0,
              left: _right,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: sideLength / 5,
                height: sideLength / 5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
