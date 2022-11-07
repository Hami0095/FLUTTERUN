import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  static const id = 'pause-btn';
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Icon(Icons.pause),
    );
  }
}
