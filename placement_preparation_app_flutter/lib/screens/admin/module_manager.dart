import 'package:flutter/material.dart';

import '../../data/sample_data.dart';
import '../../models/module.dart';
import '../../theme/app_theme.dart';

class ModuleManager extends StatefulWidget {
  const ModuleManager({super.key});

  @override
  State<ModuleManager> createState() => _ModuleManagerState();
}

class _ModuleManagerState extends State<ModuleManager> {
  late List<PlacementModule> _modules;

  @override
  void initState() {
    super.initState();
    _modules = List<PlacementModule>.from(
      SampleData.modules,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Module Manager',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Add Module',
            onPressed: _showAddModuleInfo,
            icon: const Icon(
              Icons.add_circle_outline_rounded,
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
          child: _modules.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    12,
                    20,
                    30,
                  ),
                  itemCount: _modules.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _buildModuleCard(
                      _modules[index],
                      index,
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    PlacementModule module,
    int index,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(23),
      child: InkWell(
        onTap: () => _showModuleDetails(module),
        borderRadius: BorderRadius.circular(23),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.purple,
                      AppTheme.pink,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Center(
                  child: Text(
                    module.icon,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DAY ${module.day}',
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: AppTheme.purple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      module.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      module.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppTheme.textGrey,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Icon(
                          Icons.quiz_outlined,
                          size: 14,
                          color: AppTheme.textGrey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${module.questions.length} questions',
                          style: const TextStyle(
                            fontSize: 9,
                            color: AppTheme.textGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  IconButton(
                    tooltip: 'View',
                    onPressed: () {
                      _showModuleDetails(module);
                    },
                    icon: const Icon(
                      Icons.visibility_outlined,
                      size: 20,
                      color: AppTheme.purple,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Edit',
                    onPressed: () {
                      _showEditInfo(module);
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 20,
                      color: AppTheme.pink,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '📚',
              style: TextStyle(
                fontSize: 55,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'No Modules Found',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'There are currently no modules available.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModuleDetails(
    PlacementModule module,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Container(
          height: MediaQuery.of(sheetContext).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                22,
                15,
                22,
                30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppTheme.purple,
                              AppTheme.pink,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(
                            module.icon,
                            style: const TextStyle(
                              fontSize: 28,
                            ),
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
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.purple,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              module.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _detailSection(
                    'Category',
                    module.category,
                  ),
                  _detailSection(
                    'Definition',
                    module.definition,
                  ),
                  _detailSection(
                    'Formula',
                    module.formula,
                  ),
                  _detailSection(
                    'Worked Example',
                    module.example,
                  ),
                  _detailSection(
                    'Explanation',
                    module.explanation,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppTheme.lavender.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.quiz_rounded,
                          color: AppTheme.purple,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${module.questions.length} practice questions',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _detailSection(
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 17,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F7FC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 11,
                height: 1.5,
                color: AppTheme.textGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditInfo(
    PlacementModule module,
  ) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.edit_rounded,
                color: AppTheme.purple,
              ),
              SizedBox(width: 9),
              Text(
                'Edit Module',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          content: Text(
            'Module "${module.title}" is currently loaded from SampleData.\n\n'
            'For persistent admin editing, this content will later be connected to a database such as Firebase Firestore.',
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textGrey,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAddModuleInfo() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Add Module',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'The current demo uses fixed SampleData modules. '
            'A database-backed module editor can be connected later for creating new modules.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textGrey,
            ),
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
