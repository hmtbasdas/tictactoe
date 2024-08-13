import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({required this.child, this.left = 16, this.right = 16, this.top = 0, this.bottom = 0, super.key});

  final double left, right, top, bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom), child: child);
  }
}