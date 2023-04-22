import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  double? width;
  double? height;
  Widget child;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  ElevatedContainer({
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2.0, 4.0),
              blurRadius: 6.0,
            )
          ]),
      child: child,
    );
  }
}
