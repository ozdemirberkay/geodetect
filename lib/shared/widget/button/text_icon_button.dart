import 'package:flutter/material.dart';

class IconTextButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final IconData iconData;
  final String label;
  const IconTextButton(
      {super.key,
      required this.onPressed,
      required this.iconData,
      required this.label});

  @override
  State<IconTextButton> createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  bool _isLoading = false;
  Future<void> _handlePress() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _handlePress,
      icon: Icon(widget.iconData),
      label: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            )
          : Text(widget.label),
    );
  }
}
