import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWidget());
}

class HelloWidget extends Widget {
  const HelloWidget({super.key});

  @override
  Element createElement() => HelloElement(this);
}

class HelloElement extends Element {
  HelloElement(super.widget);

  @override
  bool get debugDoingBuild => true;
}
