import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.color,
    required this.animation,
    required this.onTap,
    this.isDisabled = false,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.overrideColor,
  });

  final Color color;

  final Animation<double> animation;

  final VoidCallback onTap;

  final bool isDisabled;

  final double bottomLeft;
  final double bottomRight;
  final double topLeft;
  final double topRight;

  final Color? overrideColor;

  @override
  Widget build(BuildContext context) {
    final displayedColor =
        overrideColor ?? color;

    final borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
    );

    return Expanded(
      child: GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: displayedColor.withOpacity(0.3),
                borderRadius: borderRadius,
              ),
            ),

            FadeTransition(
              opacity: animation,
              child: Container(
                decoration: BoxDecoration(
                  color: displayedColor,
                  borderRadius: borderRadius,
                  boxShadow: [
                    BoxShadow(
                      color:
                          displayedColor.withOpacity(0.8),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}