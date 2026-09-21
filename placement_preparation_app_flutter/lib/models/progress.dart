class Progress {
  final int moduleId;
  final bool completed;
  final int totalQuestions;
  final int correctAnswers;
  final DateTime completedAt;

  const Progress({
    required this.moduleId,
    required this.completed,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.completedAt,
  });

  double get accuracy {
    if (totalQuestions == 0) {
      return 0;
    }

    return correctAnswers / totalQuestions;
  }

  Map<String, dynamic> toMap() {
    return {
      'moduleId': moduleId,
      'completed': completed,
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      moduleId: map['moduleId'] ?? 0,
      completed: map['completed'] ?? false,
      totalQuestions: map['totalQuestions'] ?? 0,
      correctAnswers: map['correctAnswers'] ?? 0,
      completedAt: DateTime.tryParse(
            map['completedAt'] ?? '',
          ) ??
          DateTime.now(),
    );
  }
}
