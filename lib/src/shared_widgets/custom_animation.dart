import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final int? index;
  const CustomAnimation({super.key, required this.child, this.index});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
// late Animation<double> _animation;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: 400 * (widget.index ?? 1)),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
