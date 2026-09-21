import 'package:flutter/material.dart';

import '../../models/progress.dart';
import '../../models/student.dart';
import '../../services/storage_service.dart';
import '../../theme/app_theme.dart';

class StudentActivity extends StatefulWidget {
  const StudentActivity({super.key});

  @override
  State<StudentActivity> createState() => _StudentActivityState();
}

class _StudentActivityState extends State<StudentActivity> {
  final StorageService _storage = StorageService();

  Student? _student;
  List<Progress> _progress = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadActivity();
  }

  Future<void> _loadActivity() async {
    final student = await _storage.getStudent();

    final progress = await _storage.getProgress();

    if (!mounted) return;

    setState(() {
      _student = student;
      _progress = progress;
      _loading = false;
    });
  }

  int get _completedCount {
    return _progress.where((item) => item.completed).length;
  }

  double get _averageAccuracy {
    final completed = _progress
        .where(
          (item) => item.completed && item.totalQuestions > 0,
        )
        .toList();

    if (completed.isEmpty) {
      return 0;
    }

    final total = completed.fold<double>(
      0,
      (sum, item) => sum + item.accuracy,
    );

    return total / completed.length;
  }

  int get _totalCorrect {
    return _progress.fold<int>(
      0,
      (sum, item) => sum + item.correctAnswers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Activity',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: _loadActivity,
            icon: const Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F2FF),
              Color(0xFFFFF6FA),
              Color(0xFFFFFBF3),
            ],
          ),
        ),
        child: SafeArea(
          child: _loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.purple,
                  ),
                )
              : RefreshIndicator(
                  color: AppTheme.purple,
                  onRefresh: _loadActivity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      12,
                      20,
                      35,
                    ),
                    child: Column(
                      children: [
                        _buildStudentCard(),
                        const SizedBox(height: 18),
                        _buildStats(),
                        const SizedBox(height: 22),
                        _buildActivityTitle(),
                        const SizedBox(height: 12),
                        _buildProgressList(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildStudentCard() {
    final student = _student;

    if (student == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Column(
          children: [
            Text(
              '👤',
              style: TextStyle(
                fontSize: 45,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'No Student Profile Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: AppTheme.textDark,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'No student profile has been created on this device yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: AppTheme.textGrey,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(21),
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
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withValues(
              alpha: 0.20,
            ),
            blurRadius: 23,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.95,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getInitials(student.name),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.purple,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  student.rollNumber,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  student.year,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            icon: Icons.check_circle_rounded,
            value: '$_completedCount',
            label: 'Completed',
            color: const Color(0xFF43A047),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            icon: Icons.track_changes_rounded,
            value: '${(_averageAccuracy * 100).round()}%',
            label: 'Accuracy',
            color: AppTheme.purple,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            icon: Icons.star_rounded,
            value: '$_totalCorrect',
            label: 'Correct',
            color: const Color(0xFFFF9800),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.03,
            ),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 23,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: AppTheme.textGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTitle() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Module Activity',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.textDark,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Student progress recorded on this device',
                style: TextStyle(
                  fontSize: 10,
                  color: AppTheme.textGrey,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppTheme.lavender,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '${_progress.length} records',
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: AppTheme.purple,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressList() {
    if (_progress.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Column(
          children: [
            Text(
              '📈',
              style: TextStyle(
                fontSize: 45,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'No Activity Yet',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: AppTheme.textDark,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Student module activity will appear here after completing practice tests.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 1.5,
                color: AppTheme.textGrey,
              ),
            ),
          ],
        ),
      );
    }

    final sorted = List<Progress>.from(_progress)
      ..sort(
        (a, b) => b.completedAt.compareTo(
          a.completedAt,
        ),
      );

    return Column(
      children: sorted.map(
        (progress) {
          return _buildProgressCard(progress);
        },
      ).toList(),
    );
  }

  Widget _buildProgressCard(
    Progress progress,
  ) {
    final accuracy = progress.accuracy * 100;

    final color = accuracy >= 80
        ? const Color(0xFF43A047)
        : accuracy >= 60
            ? AppTheme.purple
            : const Color(0xFFFF9800);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 11,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              progress.completed
                  ? Icons.check_circle_rounded
                  : Icons.pending_rounded,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Module ${progress.moduleId}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${progress.correctAnswers}/${progress.totalQuestions} correct',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppTheme.textGrey,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _formatDate(
                    progress.completedAt,
                  ),
                  style: const TextStyle(
                    fontSize: 9,
                    color: AppTheme.textGrey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${accuracy.round()}%',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');

    final month = date.month.toString().padLeft(2, '0');

    final year = date.year.toString();

    final hour =
        date.hour == 0 ? 12 : (date.hour > 12 ? date.hour - 12 : date.hour);

    final minute = date.minute.toString().padLeft(2, '0');

    final period = date.hour >= 12 ? 'PM' : 'AM';

    return '$day/$month/$year • '
        '$hour:$minute $period';
  }

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty || parts.first.isEmpty) {
      return 'ST';
    }

    if (parts.length == 1) {
      final text = parts.first;

      if (text.length == 1) {
        return text.toUpperCase();
      }

      return text.substring(0, 2).toUpperCase();
    }

    return '${parts.first[0]}'
            '${parts.last[0]}'
        .toUpperCase();
  }
}
