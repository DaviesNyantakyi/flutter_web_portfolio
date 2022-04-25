import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final double elevation;
  final double height;
  final double? width;
  final Widget child;
  final VoidCallback? onPressed;
  const CustomElevatedButton({
    Key? key,
    this.backgroundColor = Colors.blue,
    this.elevation = 0,
    required this.child,
    this.onPressed,
    this.height = 44,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: elevation,
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

class CustomInkwellButton extends StatelessWidget {
  final Color backgroundColor;
  final Color hoverColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final VoidCallback? onTap;
  final Function(bool)? onHover;
  const CustomInkwellButton({
    Key? key,
    this.backgroundColor = Colors.blue,
    this.hoverColor = Colors.grey,
    this.borderRadius,
    required this.child,
    this.onTap,
    this.onHover,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(backgroundColor),
        borderRadius: borderRadius,
        child: Padding(
          padding: padding!,
          child: child,
        ),
        hoverColor: hoverColor,
        onTap: onTap,
        onHover: onHover,
      ),
    );
  }
}
