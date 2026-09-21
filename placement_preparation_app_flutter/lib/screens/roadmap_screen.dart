import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/module.dart';
import '../models/progress.dart';
import '../models/student.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'module_detail_screen.dart';

class RoadmapScreen extends StatefulWidget {
  final StorageService storage;
  final Student student;

  const RoadmapScreen({
    super.key,
    required this.storage,
    required this.student,
  });

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  List<Progress> _progress = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final progress = await widget.storage.getProgress();

    if (!mounted) return;

    setState(() {
      _progress = progress;
      _loading = false;
    });
  }

  bool _isCompleted(PlacementModule module) {
    return _progress.any(
      (item) => item.moduleId == module.id && item.completed,
    );
  }

  bool _isUnlocked(PlacementModule module) {
    if (module.id == 1) {
      return true;
    }

    final previous = SampleData.modules.firstWhere(
      (item) => item.id == module.id - 1,
      orElse: () => module,
    );

    return _isCompleted(previous);
  }

  int get _completedCount {
    return _progress.where((item) => item.completed).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learning Roadmap',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF7F0FF),
              Color(0xFFFFF5F8),
              Color(0xFFFFFAF1),
            ],
          ),
        ),
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.purple,
                ),
              )
            : RefreshIndicator(
                onRefresh: _loadProgress,
                color: AppTheme.purple,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        10,
                        20,
                        40,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _buildHeader(),
                          const SizedBox(height: 25),
                          _buildRoadmap(),
                          const SizedBox(height: 30),
                          _buildBottomMessage(),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildHeader() {
    final percentage = SampleData.modules.isEmpty
        ? 0.0
        : _completedCount / SampleData.modules.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.deepPurple,
            AppTheme.purple,
            AppTheme.pink,
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withValues(alpha: 0.22),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 82,
            height: 82,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 8,
                  backgroundColor: Colors.white.withValues(alpha: 0.18),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
                Text(
                  '${(percentage * 100).round()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Placement Path 🚀',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  '$_completedCount of ${SampleData.modules.length} '
                  'modules completed',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Complete one module at a time ✨',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmap() {
    return Column(
      children: List.generate(
        SampleData.modules.length,
        (index) {
          final module = SampleData.modules[index];

          return _buildRoadmapItem(
            module,
            index,
          );
        },
      ),
    );
  }

  Widget _buildRoadmapItem(
    PlacementModule module,
    int index,
  ) {
    final completed = _isCompleted(module);
    final unlocked = _isUnlocked(module);
    final isLast = index == SampleData.modules.length - 1;

    final alignment =
        index.isEven ? Alignment.centerLeft : Alignment.centerRight;

    return Column(
      children: [
        SizedBox(
          height: 175,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (!isLast)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 145,
                  child: _buildPathLine(
                    index,
                  ),
                ),
              Align(
                alignment: alignment,
                child: _buildNode(
                  module,
                  completed,
                  unlocked,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPathLine(int index) {
    final nextModule = SampleData.modules[index + 1];

    final nextUnlocked = _isUnlocked(nextModule);

    return SizedBox(
      height: 50,
      child: CustomPaint(
        painter: _RoadLinePainter(
          active: nextUnlocked,
        ),
      ),
    );
  }

  Widget _buildNode(
    PlacementModule module,
    bool completed,
    bool unlocked,
  ) {
    final nodeColor = completed
        ? const Color(0xFF43A047)
        : unlocked
            ? AppTheme.purple
            : const Color(0xFFB8B3C5);

    return GestureDetector(
      onTap: unlocked
          ? () => _openModule(module)
          : () => _showLockedMessage(module),
      child: Container(
        width: 178,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: completed
                ? const Color(0xFFB8E0BA)
                : unlocked
                    ? AppTheme.lavender
                    : const Color(0xFFE2DFE8),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: nodeColor.withValues(alpha: 0.10),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: unlocked
                      ? [
                          nodeColor,
                          AppTheme.pink,
                        ]
                      : [
                          const Color(0xFFD6D2DF),
                          const Color(0xFFBDB8C9),
                        ],
                ),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Center(
                child: completed
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 29,
                      )
                    : unlocked
                        ? Text(
                            module.icon,
                            style: const TextStyle(
                              fontSize: 26,
                            ),
                          )
                        : const Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DAY ${module.day}',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      color: nodeColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    module.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.2,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    module.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppTheme.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openModule(
    PlacementModule module,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ModuleDetailScreen(
          storage: widget.storage,
          student: widget.student,
          module: module,
        ),
      ),
    );

    await _loadProgress();
  }

  void _showLockedMessage(
    PlacementModule module,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTheme.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Row(
          children: [
            const Icon(
              Icons.lock_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Complete the previous module to unlock Day ${module.day}.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMessage() {
    final completedAll = _completedCount == SampleData.modules.length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: completedAll
            ? const Color(0xFFE8F5E9)
            : Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Text(
            completedAll ? '🏆' : '🌱',
            style: const TextStyle(
              fontSize: 34,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              completedAll
                  ? 'You completed the entire placement roadmap! 🎉'
                  : 'Small steps every day lead to big placement success.',
              style: TextStyle(
                fontSize: 12,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color:
                    completedAll ? const Color(0xFF2E7D32) : AppTheme.textGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoadLinePainter extends CustomPainter {
  final bool active;

  _RoadLinePainter({
    required this.active,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = active
          ? AppTheme.purple.withValues(alpha: 0.45)
          : Colors.grey.withValues(alpha: 0.18)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(size.width * 0.25, 0);

    path.cubicTo(
      size.width * 0.15,
      size.height * 0.5,
      size.width * 0.85,
      size.height * 0.5,
      size.width * 0.75,
      size.height,
    );

    canvas.drawPath(path, paint);

    if (active) {
      final dotPaint = Paint()
        ..color = AppTheme.pink
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(
          size.width * 0.5,
          size.height * 0.5,
        ),
        5,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _RoadLinePainter oldDelegate,
  ) {
    return oldDelegate.active != active;
  }
}
