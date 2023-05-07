import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required Animation<Offset> animation,
  }) : _animation = animation;

  final Animation<Offset> _animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: const Text(
        "Read Free Books",
        textAlign: TextAlign.center,
      ),
    );
  }
}
