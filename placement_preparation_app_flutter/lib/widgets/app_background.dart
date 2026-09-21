import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8F2FF),
            Color(0xFFFFF4FA),
            Color(0xFFFFFBF3),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -70,
            child: _bubble(
              size: 210,
              color: const Color(0xFFE7D9FF),
            ),
          ),
          Positioned(
            top: 210,
            left: -80,
            child: _bubble(
              size: 170,
              color: const Color(0xFFFFDDF0),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -60,
            child: _bubble(
              size: 220,
              color: const Color(0xFFFFEACB),
            ),
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _bubble({
    required double size,
    required Color color,
  }) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.45),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
