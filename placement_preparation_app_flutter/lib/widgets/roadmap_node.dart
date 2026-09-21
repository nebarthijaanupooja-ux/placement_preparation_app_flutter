import 'package:flutter/material.dart';

import '../models/module.dart';
import '../theme/app_theme.dart';

class RoadmapNode extends StatelessWidget {
  final PlacementModule module;
  final bool completed;
  final bool unlocked;
  final VoidCallback? onTap;

  const RoadmapNode({
    super.key,
    required this.module,
    required this.completed,
    required this.unlocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final active = unlocked || completed;

    return GestureDetector(
      onTap: active ? onTap : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppTheme.purple.withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: completed
                ? AppTheme.pink
                : active
                    ? AppTheme.purple.withValues(alpha: 0.25)
                    : Colors.grey.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: completed
                      ? [
                          AppTheme.pink,
                          AppTheme.purple,
                        ]
                      : active
                          ? [
                              AppTheme.purple,
                              AppTheme.deepPurple,
                            ]
                          : [
                              Colors.grey.shade300,
                              Colors.grey.shade200,
                            ],
                ),
              ),
              child: Center(
                child: Text(
                  active ? module.icon : '🔒',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DAY ${module.day}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.pink,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    module.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    module.category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              completed
                  ? Icons.check_circle_rounded
                  : active
                      ? Icons.arrow_forward_ios_rounded
                      : Icons.lock_rounded,
              size: 22,
              color: completed
                  ? AppTheme.pink
                  : active
                      ? AppTheme.purple
                      : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
