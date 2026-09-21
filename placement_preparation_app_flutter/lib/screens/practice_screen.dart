import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/question.dart';
import '../models/progress.dart';
import '../models/student.dart';
import '../services/storage_service.dart';
import '../theme/app_theme.dart';
import 'result_screen.dart';

class PracticeScreen extends StatefulWidget {
  final StorageService storage;
  final Student student;
  final PlacementModule module;

  const PracticeScreen({
    super.key,
    required this.storage,
    required this.student,
    required this.module,
  });

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _currentQuestion = 0;
  int? _selectedAnswer;
  bool _answered = false;
  int _correctAnswers = 0;
  bool _saving = false;

  List<Question> get _questions => widget.module.questions;

  Question get _question => _questions[_currentQuestion];

  void _selectAnswer(int index) {
    if (_answered) return;

    setState(() {
      _selectedAnswer = index;
      _answered = true;

      if (index == _question.answerIndex) {
        _correctAnswers++;
      }
    });
  }

  Future<void> _nextQuestion() async {
    if (!_answered) return;

    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
      });

      return;
    }

    await _finishTest();
  }

  Future<void> _finishTest() async {
    if (_saving) return;

    setState(() {
      _saving = true;
    });

    final progress = Progress(
      moduleId: widget.module.id,
      completed: true,
      totalQuestions: _questions.length,
      correctAnswers: _correctAnswers,
      completedAt: DateTime.now(),
    );

    await widget.storage.saveProgress(progress);

    if (!mounted) return;

    setState(() {
      _saving = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          storage: widget.storage,
          student: widget.student,
          module: widget.module,
          correctAnswers: _correctAnswers,
          totalQuestions: _questions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentQuestion + 1) / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.module.title} • Practice',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
              8,
              20,
              30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProgress(progress),
                const SizedBox(height: 20),
                _buildQuestionCard(),
                const SizedBox(height: 16),
                if (_answered) _buildExplanation(),
                if (_answered) const SizedBox(height: 18),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgress(double progress) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Question ${_currentQuestion + 1} '
                  'of ${_questions.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
              Text(
                '$_correctAnswers correct',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF43A047),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              backgroundColor: AppTheme.lavender,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppTheme.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
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
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.purple,
                      AppTheme.pink,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.help_outline_rounded,
                  color: Colors.white,
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Practice Question',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            _question.question,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            _question.options.length,
            (index) => _buildOption(
              index,
              _question.options[index],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    int index,
    String text,
  ) {
    final isSelected = _selectedAnswer == index;

    final isCorrect = index == _question.answerIndex;

    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.withValues(alpha: 0.18);
    Color textColor = AppTheme.textDark;

    if (_answered && isCorrect) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF66BB6A);
      textColor = const Color(0xFF2E7D32);
    } else if (_answered && isSelected) {
      backgroundColor = const Color(0xFFFFEBEE);
      borderColor = const Color(0xFFEF5350);
      textColor = const Color(0xFFC62828);
    } else if (isSelected) {
      backgroundColor = AppTheme.lavender;
      borderColor = AppTheme.purple;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _selectAnswer(index),
          borderRadius: BorderRadius.circular(17),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: borderColor,
                width: isSelected || (_answered && isCorrect) ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: _optionCircleColor(
                      index,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: _answered && isCorrect
                        ? const Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: Colors.white,
                          )
                        : _answered && isSelected
                            ? const Icon(
                                Icons.close_rounded,
                                size: 18,
                                color: Colors.white,
                              )
                            : Text(
                                String.fromCharCode(
                                  65 + index,
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.purple,
                                ),
                              ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _optionCircleColor(int index) {
    if (_answered && index == _question.answerIndex) {
      return const Color(0xFF43A047);
    }

    if (_answered && index == _selectedAnswer) {
      return const Color(0xFFE53935);
    }

    if (_selectedAnswer == index) {
      return AppTheme.purple;
    }

    return AppTheme.lavender;
  }

  Widget _buildExplanation() {
    final correct = _selectedAnswer == _question.answerIndex;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: correct ? const Color(0xFFE8F5E9) : const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: correct ? const Color(0xFFA5D6A7) : const Color(0xFFFFCC80),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct ? Icons.check_circle_rounded : Icons.lightbulb_rounded,
            color: correct ? const Color(0xFF43A047) : const Color(0xFFFF9800),
            size: 25,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  correct ? 'Correct! 🎉' : 'Not quite — learn from it!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: correct
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFE65100),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _question.explanation,
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

  Widget _buildNextButton() {
    final isLast = _currentQuestion == _questions.length - 1;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _answered && !_saving ? _nextQuestion : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.purple,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.withValues(alpha: 0.18),
          disabledForegroundColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: _saving
            ? const SizedBox(
                width: 23,
                height: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLast ? 'Finish Test' : 'Next Question',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 9),
                  Icon(
                    isLast ? Icons.flag_rounded : Icons.arrow_forward_rounded,
                    size: 20,
                  ),
                ],
              ),
      ),
    );
  }
}
