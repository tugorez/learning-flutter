import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class Gap extends LeafRenderObjectWidget {
  final double mainAxisExtent;

  const Gap(this.mainAxisExtent, {super.key});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderGap(mainAxisExtent: mainAxisExtent);

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.mainAxisExtent = mainAxisExtent;
  }
}

class RenderGap extends RenderBox {
  RenderGap({
    required double mainAxisExtent,
  }) : _mainAxisExtent = mainAxisExtent;

  double _mainAxisExtent = 0;

  double get mainAxisExtent => _mainAxisExtent;

  set mainAxisExtent(double value) {
    if (value == _mainAxisExtent) return;

    _mainAxisExtent = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final flex = parent as RenderFlex;
    size = flex.direction == Axis.horizontal
        ? Size(mainAxisExtent, 0)
        : Size(0, mainAxisExtent);
  }
}
