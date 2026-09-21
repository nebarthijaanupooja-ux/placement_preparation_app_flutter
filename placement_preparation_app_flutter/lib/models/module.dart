import 'question.dart';

class PlacementModule {
  final int id;
  final int day;
  final String title;
  final String category;
  final String icon;
  final String definition;
  final String formula;
  final String example;
  final String explanation;
  final List<Question> questions;

  const PlacementModule({
    required this.id,
    required this.day,
    required this.title,
    required this.category,
    required this.icon,
    required this.definition,
    required this.formula,
    required this.example,
    required this.explanation,
    required this.questions,
  });
}
