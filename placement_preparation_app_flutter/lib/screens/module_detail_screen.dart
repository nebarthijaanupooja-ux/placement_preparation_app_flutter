import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/student.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'practice_screen.dart';

class ModuleDetailScreen extends StatelessWidget {
  final StorageService storage;
  final Student student;
  final PlacementModule module;

  const ModuleDetailScreen({
    super.key,
    required this.storage,
    required this.student,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Day ${module.day}',
          style: const TextStyle(
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
              Color(0xFFF8F2FF),
              Color(0xFFFFF7FA),
              Color(0xFFFFFBF4),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              5,
              20,
              35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHero(),
                const SizedBox(height: 20),
                _buildDefinition(),
                const SizedBox(height: 16),
                _buildFormula(),
                const SizedBox(height: 16),
                _buildKeyPoints(),
                const SizedBox(height: 16),
                _buildExample(),
                const SizedBox(height: 24),
                _buildPracticeButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
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
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withValues(alpha: 0.20),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(
                    alpha: 0.18,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    module.icon,
                    style: const TextStyle(
                      fontSize: 31,
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
                      'DAY ${module.day}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      module.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.14,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              module.category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinition() {
    return _contentCard(
      icon: Icons.menu_book_rounded,
      iconColor: AppTheme.purple,
      title: 'Definition',
      child: Text(
        module.definition,
        style: const TextStyle(
          fontSize: 13,
          height: 1.65,
          color: AppTheme.textGrey,
        ),
      ),
    );
  }

  Widget _buildFormula() {
    return _contentCard(
      icon: Icons.calculate_rounded,
      iconColor: const Color(0xFFFF8A65),
      title: 'Formula / Key Formula',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3ED),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Text(
          module.formula,
          style: const TextStyle(
            fontSize: 14,
            height: 1.6,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9A4D2F),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyPoints() {
    final points = _extractKeyPoints(
      module.definition,
      module.formula,
    );

    return _contentCard(
      icon: Icons.lightbulb_rounded,
      iconColor: const Color(0xFFFFB300),
      title: 'Key Points',
      child: Column(
        children: points.map(
          (point) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3CD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 14,
                      color: Color(0xFFFFA000),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: AppTheme.textGrey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildExample() {
    return _contentCard(
      icon: Icons.auto_awesome_rounded,
      iconColor: const Color(0xFF43A047),
      title: 'Worked Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F8F1),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              module.example,
              style: const TextStyle(
                fontSize: 13,
                height: 1.6,
                fontWeight: FontWeight.w700,
                color: Color(0xFF336B37),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'Explanation',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            module.explanation,
            style: const TextStyle(
              fontSize: 12,
              height: 1.6,
              color: AppTheme.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.035,
            ),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 21,
                ),
              ),
              const SizedBox(width: 11),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildPracticeButton(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppTheme.purple,
            AppTheme.pink,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withValues(
              alpha: 0.22,
            ),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PracticeScreen(
                storage: storage,
                student: student,
                module: module,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          minimumSize: const Size(
            double.infinity,
            58,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.quiz_rounded,
              size: 22,
            ),
            SizedBox(width: 10),
            Text(
              'Start Practice Test',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_rounded,
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _extractKeyPoints(
    String definition,
    String formula,
  ) {
    final points = <String>[];

    final definitionSentences = definition.split(RegExp(r'(?<=[.!?])\s+'));

    for (final sentence in definitionSentences) {
      final cleaned = sentence.trim();

      if (cleaned.isNotEmpty && !points.contains(cleaned)) {
        points.add(cleaned);
      }

      if (points.length == 2) {
        break;
      }
    }

    if (formula.trim().isNotEmpty && points.length < 3) {
      points.add(
        'Remember the important formula and apply it carefully while solving problems.',
      );
    }

    if (points.length < 3) {
      points.add(
        'Practice the concept regularly to improve speed and accuracy.',
      );
    }

    return points.take(3).toList();
  }
}
