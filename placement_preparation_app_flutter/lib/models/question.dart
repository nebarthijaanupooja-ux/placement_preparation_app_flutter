class Question {
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explanation;

  const Question({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.explanation,
  });
}
