// ignore_for_file: must_be_immutable, library_private_types_in_public_api, file_names

import 'package:apple_shop_ir/common/components/components.dart';
import 'package:flutter/material.dart';

class ImageScaleAnimation extends StatefulWidget {
  ImageScaleAnimation({
    super.key,
    required this.image,
    this.seconds = 1,
    this.begin = 1,
    this.end = 1.1,
  });
  String image;
  int seconds;
  double begin;
  double end;
  @override
  _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
}

class _ImageScaleAnimationState extends State<ImageScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late int seconds = widget.seconds;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: seconds),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Components.assetImage(image: widget.image),
        );
      },
    );
  }
}
