import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/sample_data.dart';
import '../../services/storage_service.dart';
import '../../theme/app_theme.dart';
import 'admin_login.dart';
import 'module_manager.dart';
import 'question_manager.dart';
import 'student_activity.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => AdminLoginScreen(
          storage: StorageService(),
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () => _logout(context),
            icon: const Icon(
              Icons.logout_rounded,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcome(),
                const SizedBox(height: 20),
                _buildOverview(),
                const SizedBox(height: 25),
                _buildManagementTitle(),
                const SizedBox(height: 13),
                _buildManagementGrid(context),
                const SizedBox(height: 25),
                _buildPlatformCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(23),
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
            color: AppTheme.purple.withValues(
              alpha: 0.20,
            ),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Admin 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Manage modules, questions and student activity from one place.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Text(
            '🛠️',
            style: TextStyle(
              fontSize: 47,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    final moduleCount = SampleData.modules.length;

    final questionCount =
        SampleData.modules.fold<int>(
      0,
      (sum, module) =>
          sum + module.questions.length,
    );

    return Row(
      children: [
        Expanded(
          child: _overviewCard(
            icon: Icons.menu_book_rounded,
            value: '$moduleCount',
            label: 'Modules',
            color: AppTheme.purple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _overviewCard(
            icon: Icons.quiz_rounded,
            value: '$questionCount',
            label: 'Questions',
            color: AppTheme.pink,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _overviewCard(
            icon: Icons.people_alt_rounded,
            value: '0',
            label: 'Students',
            color: const Color(0xFF43A047),
          ),
        ),
      ],
    );
  }

  Widget _overviewCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.035,
            ),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(
                alpha: 0.10,
              ),
              borderRadius:
                  BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
              size: 21,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 2),
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

  Widget _buildManagementTitle() {
    return const Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          'Management',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.textDark,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Manage your placement preparation content.',
          style: TextStyle(
            fontSize: 11,
            color: AppTheme.textGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildManagementGrid(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _managementCard(
                context: context,
                icon: Icons.library_books_rounded,
                title: 'Modules',
                subtitle:
                    'View & manage modules',
                color: AppTheme.purple,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const ModuleManager(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _managementCard(
                context: context,
                icon: Icons.quiz_rounded,
                title: 'Questions',
                subtitle:
                    'Manage practice tests',
                color: AppTheme.pink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const QuestionManager(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _managementCard(
                context: context,
                icon: Icons.people_alt_rounded,
                title: 'Students',
                subtitle:
                    'View student activity',
                color:
                    const Color(0xFF43A047),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const StudentActivity(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _managementCard(
                context: context,
                icon: Icons.analytics_rounded,
                title: 'Analytics',
                subtitle:
                    'View platform insights',
                color:
                    const Color(0xFFFF9800),
                onTap: () {
                  _showAnalytics(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _managementCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 2,
                overflow:
                    TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  height: 1.4,
                  color: AppTheme.textGrey,
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                Icons.arrow_forward_rounded,
                size: 17,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlatformCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF1F7),
            Color(0xFFF2EDFF),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            '📊',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Overview',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.textDark,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Manage modules, questions and student activity from your admin dashboard.',
                  style: TextStyle(
                    fontSize: 11,
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

  void _showAnalytics(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.analytics_rounded,
                color: AppTheme.purple,
              ),
              SizedBox(width: 9),
              Text(
                'Analytics',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          content: const Text(
            'Student analytics can be connected to Firebase data from the admin dashboard.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}