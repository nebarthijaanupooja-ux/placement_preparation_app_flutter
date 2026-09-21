import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/student.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'dashboard_screen.dart';

class ResultScreen extends StatelessWidget {
  final StorageService storage;
  final Student student;
  final PlacementModule module;
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.storage,
    required this.student,
    required this.module,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  double get percentage {
    if (totalQuestions == 0) {
      return 0;
    }

    return correctAnswers / totalQuestions;
  }

  String get performanceTitle {
    if (percentage >= 0.8) {
      return 'Excellent Work! 🎉';
    }

    if (percentage >= 0.6) {
      return 'Good Job! 🌟';
    }

    if (percentage >= 0.4) {
      return 'Keep Practicing! 💪';
    }

    return 'Nice Try! 🌱';
  }

  String get performanceMessage {
    if (percentage >= 0.8) {
      return 'You have a strong understanding of this module.';
    }

    if (percentage >= 0.6) {
      return 'You are on the right track. A little more practice will help.';
    }

    if (percentage >= 0.4) {
      return 'Review the concepts once more and try similar questions again.';
    }

    return 'Don’t worry. Learning takes practice. Review the module and keep going!';
  }

  Color get scoreColor {
    if (percentage >= 0.8) {
      return const Color(0xFF43A047);
    }

    if (percentage >= 0.6) {
      return const Color(0xFF7E57C2);
    }

    if (percentage >= 0.4) {
      return const Color(0xFFFF9800);
    }

    return const Color(0xFFEF5350);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              25,
              20,
              30,
            ),
            child: Column(
              children: [
                _buildTopIcon(),
                const SizedBox(height: 18),
                _buildTitle(),
                const SizedBox(height: 24),
                _buildScoreCard(),
                const SizedBox(height: 18),
                _buildStats(),
                const SizedBox(height: 18),
                _buildMessage(),
                const SizedBox(height: 25),
                _buildContinueButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcon() {
    return Container(
      width: 82,
      height: 82,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.purple,
            AppTheme.pink,
          ],
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withValues(
              alpha: 0.20,
            ),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.emoji_events_rounded,
        color: Colors.white,
        size: 43,
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          performanceTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          'Day ${module.day} • ${module.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildScoreCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: scoreColor.withValues(
              alpha: 0.10,
            ),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 170,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 14,
                    backgroundColor: AppTheme.lavender,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      scoreColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(percentage * 100).round()}%',
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.w900,
                        color: scoreColor,
                      ),
                    ),
                    const Text(
                      'SCORE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        color: AppTheme.textGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            '$correctAnswers / $totalQuestions',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Correct Answers',
            style: TextStyle(
              fontSize: 11,
              color: AppTheme.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    final wrongAnswers = totalQuestions - correctAnswers;

    return Row(
      children: [
        Expanded(
          child: _statCard(
            icon: Icons.check_circle_rounded,
            value: '$correctAnswers',
            label: 'Correct',
            color: const Color(0xFF43A047),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            icon: Icons.cancel_rounded,
            value: '$wrongAnswers',
            label: 'Review',
            color: const Color(0xFFEF5350),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            icon: Icons.quiz_rounded,
            value: '$totalQuestions',
            label: 'Questions',
            color: AppTheme.purple,
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
        vertical: 17,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
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

  Widget _buildMessage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            scoreColor.withValues(alpha: 0.08),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: scoreColor.withValues(
            alpha: 0.18,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            percentage >= 0.6 ? '✨' : '💡',
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Keep Going',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  performanceMessage,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: AppTheme.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => DashboardScreen(
                storage: storage,
                student: student,
              ),
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.purple,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dashboard_rounded,
              size: 21,
            ),
            SizedBox(width: 9),
            Text(
              'Back to Dashboard',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
