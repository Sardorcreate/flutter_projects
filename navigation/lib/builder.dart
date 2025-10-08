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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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

class InkWellBuilder extends StatelessWidget {
  const InkWellBuilder({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ContainersBuilder(
        width: 120, height: 110, color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.teal,),
            Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.teal,
              ),
            )
          ],
        ),
      ),
    );
  }
}