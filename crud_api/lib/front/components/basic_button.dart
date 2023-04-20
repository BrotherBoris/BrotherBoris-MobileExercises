import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  BasicButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

class VisibleButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  bool isVisible;

  VisibleButton({required this.buttonText, required this.onPressed, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ));
  }
}
