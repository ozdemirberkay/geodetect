import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const CustomFAB({super.key, required this.onPressed, required this.iconData});

  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
