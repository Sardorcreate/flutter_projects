import 'package:flutter/material.dart';

class ContainersBuilder extends StatelessWidget {
  const ContainersBuilder({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    this.radius = 15,
    this.border,
    this.child,
  });

  final double width;
  final double height;
  final Color color;
  final double radius;
  final Color? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: border != null
            ? Border.all(color: border!)
            : null,
      ),
      child: child,
    );
  }
}

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({
    super.key,
    required this.text1,
    required this.text2,
    required this.size1,
    required this.size2,
  });

  final String text1;
  final String text2;
  final double size1;
  final double size2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text1, style: TextStyle(fontSize: size1)),
        Text(
          text2,
          style: TextStyle(fontSize: size2, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

