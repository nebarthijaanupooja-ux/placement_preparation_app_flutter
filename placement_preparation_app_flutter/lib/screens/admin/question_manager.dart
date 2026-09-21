import 'package:flutter/material.dart';

import '../../data/sample_data.dart';
import '../../models/module.dart';
import '../../models/question.dart';
import '../../theme/app_theme.dart';

class QuestionManager extends StatefulWidget {
  const QuestionManager({super.key});

  @override
  State<QuestionManager> createState() => _QuestionManagerState();
}

class _QuestionManagerState extends State<QuestionManager> {
  int _selectedModuleIndex = 0;

  List<PlacementModule> get _modules => SampleData.modules;

  PlacementModule get _selectedModule => _modules[_selectedModuleIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Question Manager',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Add Question',
            onPressed: _showAddQuestionInfo,
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
          child: Column(
            children: [
              _buildModuleSelector(),
              Expanded(
                child: _selectedModule.questions.isEmpty
                    ? _buildEmptyState()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          5,
                          20,
                          30,
                        ),
                        itemCount: _selectedModule.questions.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _buildQuestionCard(
                            _selectedModule.questions[index],
                            index,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModuleSelector() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        15,
      ),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Module',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 9),
          DropdownButtonFormField<int>(
            initialValue: _selectedModuleIndex,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.lavender.withValues(alpha: 0.45),
              prefixIcon: const Icon(
                Icons.menu_book_rounded,
                color: AppTheme.purple,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 13,
              ),
            ),
            items: List.generate(
              _modules.length,
              (index) {
                final module = _modules[index];

                return DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    'Day ${module.day} • ${module.title}',
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
            onChanged: (value) {
              if (value == null) return;

              setState(() {
                _selectedModuleIndex = value;
              });
            },
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const Icon(
                Icons.quiz_outlined,
                size: 15,
                color: AppTheme.textGrey,
              ),
              const SizedBox(width: 5),
              Text(
                '${_selectedModule.questions.length} questions in this module',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppTheme.textGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
    Question question,
    int index,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(23),
      child: InkWell(
        onTap: () {
          _showQuestionDetails(
            question,
            index,
          );
        },
        borderRadius: BorderRadius.circular(23),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppTheme.purple,
                          AppTheme.pink,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Text(
                      'Practice Question',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Edit',
                    onPressed: () {
                      _showEditInfo(
                        question,
                        index,
                      );
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppTheme.pink,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                question.question,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 13),
              ...List.generate(
                question.options.length,
                (optionIndex) {
                  final correct = optionIndex == question.answerIndex;

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: correct
                                ? const Color(
                                    0xFFE8F5E9,
                                  )
                                : const Color(
                                    0xFFF5F3F8,
                                  ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: correct
                                ? const Icon(
                                    Icons.check_rounded,
                                    size: 14,
                                    color: Color(
                                      0xFF43A047,
                                    ),
                                  )
                                : Text(
                                    String.fromCharCode(
                                      65 + optionIndex,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.textGrey,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            question.options[optionIndex],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight:
                                  correct ? FontWeight.w800 : FontWeight.w500,
                              color: correct
                                  ? const Color(
                                      0xFF2E7D32,
                                    )
                                  : AppTheme.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
              '❓',
              style: TextStyle(
                fontSize: 55,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'No Questions Found',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'This module does not contain any practice questions.',
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

  void _showQuestionDetails(
    Question question,
    int index,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Container(
          height: MediaQuery.of(sheetContext).size.height * 0.72,
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
                  Text(
                    'Question ${index + 1}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    question.options.length,
                    (optionIndex) {
                      final correct = optionIndex == question.answerIndex;

                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          bottom: 9,
                        ),
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: correct
                              ? const Color(
                                  0xFFE8F5E9,
                                )
                              : const Color(
                                  0xFFF8F6FB,
                                ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(
                            color: correct
                                ? const Color(
                                    0xFFA5D6A7,
                                  )
                                : Colors.transparent,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${String.fromCharCode(65 + optionIndex)}.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: correct
                                    ? const Color(
                                        0xFF2E7D32,
                                      )
                                    : AppTheme.textGrey,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                question.options[optionIndex],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: correct
                                      ? FontWeight.w800
                                      : FontWeight.w500,
                                  color: correct
                                      ? const Color(
                                          0xFF2E7D32,
                                        )
                                      : AppTheme.textDark,
                                ),
                              ),
                            ),
                            if (correct)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF43A047),
                                size: 19,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Explanation',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFFFF8ED,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      question.explanation,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.5,
                        color: AppTheme.textGrey,
                      ),
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

  void _showEditInfo(
    Question question,
    int index,
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
                'Edit Question',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          content: Text(
            'Question ${index + 1} is currently loaded from SampleData.\n\n'
            'Persistent question editing can be connected to Firebase Firestore or another backend later.',
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

  void _showAddQuestionInfo() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Add Question',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'The demo currently uses fixed SampleData questions. '
            'A database-backed question editor can be added later for persistent admin changes.',
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
