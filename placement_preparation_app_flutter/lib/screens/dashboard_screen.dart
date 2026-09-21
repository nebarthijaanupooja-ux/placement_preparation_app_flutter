import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/category_data.dart';
import '../data/sample_data.dart';
import '../models/main_category.dart';
import '../models/module.dart';
import '../models/progress.dart';
import '../models/student.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'module_detail_screen.dart';
import 'profile_view_screen.dart';
import 'reminder_screen.dart';
import 'roadmap_screen.dart';
import 'splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  final StorageService storage;
  final Student student;

  const DashboardScreen({
    super.key,
    required this.storage,
    required this.student,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Progress> _progress = [];

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
    });
  }

  int get _completedCount =>
      _progress.where((item) => item.completed).length;

  double get _averageAccuracy {
    if (_progress.isEmpty) return 0;

    final total = _progress.fold<double>(
      0,
      (sum, item) => sum + item.accuracy,
    );

    return total / _progress.length;
  }

  double get _overallCompletion {
    if (SampleData.modules.isEmpty) return 0;
    return _completedCount / SampleData.modules.length;
  }

  PlacementModule? get _nextModule {
    for (final module in SampleData.modules) {
      final completed = _progress.any(
        (item) => item.moduleId == module.id && item.completed,
      );

      if (!completed) return module;
    }

    return null;
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const SplashScreen()),
      (route) => false,
    );
  }

  Future<void> _confirmLogout() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      await _logout();
    }
  }

  void _openModule(PlacementModule module) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ModuleDetailScreen(
          storage: widget.storage,
          student: widget.student,
          module: module,
        ),
      ),
    ).then((_) => _loadProgress());
  }

  void _openRoadmap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoadmapScreen(
          storage: widget.storage,
          student: widget.student,
        ),
      ),
    );
  }

  void _openReminder() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ReminderScreen()),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileViewScreen(
          storage: widget.storage,
          student: widget.student,
        ),
      ),
    );
  }

  IconData _categoryIcon(MainCategory category) {
    switch (category.id) {
      case 1:
        return Icons.chat_bubble_rounded;
      case 2:
        return Icons.calculate_rounded;
      case 3:
        return Icons.psychology_rounded;
      case 4:
        return Icons.laptop_mac_rounded;
      case 5:
        return Icons.track_changes_rounded;
      default:
        return Icons.school_rounded;
    }
  }

  Color _categoryColor(int id) {
    switch (id) {
      case 1:
        return const Color(0xFFFF7FAF);
      case 2:
        return const Color(0xFF4BA3FF);
      case 3:
        return const Color(0xFFFFB84D);
      case 4:
        return const Color(0xFF8B63FF);
      case 5:
        return const Color(0xFF35B88A);
      default:
        return AppTheme.purple;
    }
  }

  Color _categoryBackground(int id) {
    switch (id) {
      case 1:
        return const Color(0xFFFFF0F5);
      case 2:
        return const Color(0xFFEEF7FF);
      case 3:
        return const Color(0xFFFFF7E8);
      case 4:
        return const Color(0xFFF3EEFF);
      case 5:
        return const Color(0xFFECFAF5);
      default:
        return AppTheme.lavender;
    }
  }

  double _categoryProgress(MainCategory category) {
    if (category.modules.isEmpty) return 0;

    final completed = category.modules.where(
      (module) => _progress.any(
        (item) => item.moduleId == module.id && item.completed,
      ),
    ).length;

    return completed / category.modules.length;
  }

  Widget _topBar(bool compact) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF8B63FF), Color(0xFFFF7FAF)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Placement Preparation',
                style: TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (!compact)
                Text(
                  'Learn • Practice • Get Placed',
                  style: TextStyle(
                    color: AppTheme.textGrey,
                    fontSize: 11,
                  ),
                ),
            ],
          ),
        ),
        _circleButton(
          Icons.person_rounded,
          AppTheme.purple,
          _openProfile,
        ),
        const SizedBox(width: 8),
        _circleButton(
          Icons.logout_rounded,
          Colors.redAccent,
          _confirmLogout,
        ),
      ],
    );
  }

  Widget _circleButton(
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 45,
          width: 45,
          child: Icon(icon, color: color, size: 21),
        ),
      ),
    );
  }

  Widget _heroBanner() {
    final module = _nextModule;

    return Container(
      constraints: const BoxConstraints(minHeight: 220),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF6DDF0),
            Color(0xFFE8E0FF),
            Color(0xFFFFEBD8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -45,
            child: _softCircle(150, const Color(0xFFFFFFFF)),
          ),
          Positioned(
            right: 90,
            bottom: -55,
            child: _softCircle(120, const Color(0xFFFFC7DE)),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.82),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_fill_rounded,
                        color: AppTheme.purple,
                        size: 17,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Continue Learning',
                        style: TextStyle(
                          color: AppTheme.deepPurple,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Hi, ${widget.student.name} 👋',
                  style: const TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Small steps today, a brighter placement tomorrow 💜',
                  style: TextStyle(
                    color: AppTheme.textGrey,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: module == null ? _openRoadmap : () => _openModule(module),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: Text(
                    module == null
                        ? 'View Roadmap'
                        : 'Continue with ${module.title}',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.purple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _softCircle(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.25),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _overviewCard() {
    final percent = (_overallCompletion * 100).round();

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 105,
            width: 105,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 105,
                  width: 105,
                  child: CircularProgressIndicator(
                    value: _overallCompletion,
                    strokeWidth: 10,
                    backgroundColor: AppTheme.lavender,
                    valueColor: const AlwaysStoppedAnimation(
                      AppTheme.purple,
                    ),
                  ),
                ),
                Text(
                  '$percent%',
                  style: const TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overall Preparation',
                  style: TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$_completedCount of ${SampleData.modules.length} modules completed',
                  style: TextStyle(
                    color: AppTheme.textGrey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 15),
                _miniStat(
                  Icons.check_circle_rounded,
                  'Completed',
                  '$_completedCount',
                  Colors.green,
                ),
                const SizedBox(height: 9),
                _miniStat(
                  Icons.track_changes_rounded,
                  'Accuracy',
                  '${(_averageAccuracy * 100).round()}%',
                  AppTheme.purple,
                ),
                const SizedBox(height: 9),
                _miniStat(
                  Icons.local_fire_department_rounded,
                  'Streak',
                  '$_completedCount',
                  Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniStat(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppTheme.textGrey,
              fontSize: 11,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.textDark,
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(
    String title, {
    String? subtitle,
    VoidCallback? onViewAll,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.textGrey,
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: const Text(
              'View all →',
              style: TextStyle(
                color: AppTheme.purple,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _categoryCard(MainCategory category) {
    final color = _categoryColor(category.id);
    final background = _categoryBackground(category.id);
    final progress = _categoryProgress(category);
    final completed = (progress * category.modules.length).round();

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: category.modules.isEmpty
            ? null
            : () => _openModule(category.modules.first),
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.78),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      _categoryIcon(category),
                      color: color,
                      size: 22,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.78),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: color,
                      size: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              Text(
                category.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                category.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.textGrey,
                  fontSize: 11,
                  height: 1.35,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    '$completed / ${category.modules.length} modules',
                    style: TextStyle(
                      color: AppTheme.textDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${(progress * 100).round()}%',
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 7,
                  backgroundColor: Colors.white.withValues(alpha: 0.7),
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categories(bool compact) {
    final categories = CategoryData.categories;

    if (compact) {
      return Column(
        children: categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  height: 195,
                  child: _categoryCard(category),
                ),
              ),
            )
            .toList(),
      );
    }

    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        return _categoryCard(categories[index]);
      },
    );
  }

  Widget _quickAccessCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              children: [
                Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.11),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppTheme.textDark,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.textGrey,
                          fontSize: 10,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _continueCard() {
    final module = _nextModule;

    if (module == null) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFFECFAF5),
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.emoji_events_rounded,
              color: Color(0xFF35B88A),
              size: 30,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Amazing! You completed all 50 modules.',
                style: TextStyle(
                  color: AppTheme.textDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: () => _openModule(module),
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE9DFFF), Color(0xFFFFE1ED)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  color: AppTheme.purple,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Module ${module.id}',
                      style: TextStyle(
                        color: AppTheme.textGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      module.title,
                      style: const TextStyle(
                        color: AppTheme.textDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      module.category,
                      style: TextStyle(
                        color: AppTheme.textGrey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.lavender,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppTheme.purple,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentActivity() {
    final recent = [..._progress]
      ..sort((a, b) => b.completedAt.compareTo(a.completedAt));

    final items = recent.take(4).toList();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.history_rounded,
                color: AppTheme.purple,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Recent Activity',
                style: TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (items.isEmpty)
            Text(
              'Your completed modules will appear here.',
              style: TextStyle(
                color: AppTheme.textGrey,
                fontSize: 11,
              ),
            )
          else
            ...items.map(
              (item) {
                PlacementModule? module;

                for (final value in SampleData.modules) {
                  if (value.id == item.moduleId) {
                    module = value;
                    break;
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          module?.title ?? 'Module ${item.moduleId}',
                          style: const TextStyle(
                            color: AppTheme.textDark,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        '${(item.accuracy * 100).round()}%',
                        style: const TextStyle(
                          color: AppTheme.purple,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _sidePanel() {
    return Column(
      children: [
        _overviewCard(),
        const SizedBox(height: 14),
        _recentActivity(),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFEEF5), Color(0xFFFFF8F2)],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFFFF6FAE),
              ),
              SizedBox(height: 12),
              Text(
                'You can do it! 💗',
                style: TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Consistent practice today builds confidence for tomorrow.',
                style: TextStyle(
                  color: AppTheme.textGrey,
                  fontSize: 11,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heroBanner(),
              const SizedBox(height: 25),
              _sectionTitle(
                'Choose Your Preparation Path',
                subtitle: '5 focused categories • 50 modules',
              ),
              const SizedBox(height: 12),
              _categories(false),
              const SizedBox(height: 25),
              _sectionTitle(
                'Quick Access',
                subtitle: 'Keep your preparation on track',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _quickAccessCard(
                    icon: Icons.map_rounded,
                    color: AppTheme.purple,
                    title: 'Roadmap',
                    subtitle: 'View your complete learning journey',
                    onTap: _openRoadmap,
                  ),
                  const SizedBox(width: 12),
                  _quickAccessCard(
                    icon: Icons.alarm_rounded,
                    color: AppTheme.pink,
                    title: 'Reminder',
                    subtitle: 'Stay on track with daily practice',
                    onTap: _openReminder,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              _sectionTitle(
                'Continue Learning',
                subtitle: 'Pick up where you left off',
                onViewAll: _openRoadmap,
              ),
              const SizedBox(height: 12),
              _continueCard(),
            ],
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          width: 285,
          child: _sidePanel(),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _heroBanner(),
        const SizedBox(height: 20),
        _overviewCard(),
        const SizedBox(height: 25),
        _sectionTitle(
          'Choose Your Preparation Path',
          subtitle: '5 focused categories • 50 modules',
        ),
        const SizedBox(height: 12),
        _categories(true),
        const SizedBox(height: 12),
        _sectionTitle(
          'Quick Access',
          subtitle: 'Keep your preparation on track',
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _quickAccessCard(
              icon: Icons.map_rounded,
              color: AppTheme.purple,
              title: 'Roadmap',
              subtitle: 'View learning journey',
              onTap: _openRoadmap,
            ),
            const SizedBox(width: 10),
            _quickAccessCard(
              icon: Icons.alarm_rounded,
              color: AppTheme.pink,
              title: 'Reminder',
              subtitle: 'Daily practice',
              onTap: _openReminder,
            ),
          ],
        ),
        const SizedBox(height: 25),
        _sectionTitle(
          'Continue Learning',
          subtitle: 'Pick up where you left off',
        ),
        const SizedBox(height: 12),
        _continueCard(),
        const SizedBox(height: 20),
        _recentActivity(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FC),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadProgress,
          color: AppTheme.purple,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 900;

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  compact ? 16 : 28,
                  compact ? 16 : 25,
                  compact ? 16 : 28,
                  35,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1450),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _topBar(compact),
                        SizedBox(height: compact ? 18 : 24),
                        if (compact)
                          _mobileLayout()
                        else
                          _desktopLayout(),
                        const SizedBox(height: 25),
                        Center(
                          child: Text(
                            'Learn • Practice • Improve • Get Placed 🚀',
                            style: TextStyle(
                              color: AppTheme.textGrey,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
