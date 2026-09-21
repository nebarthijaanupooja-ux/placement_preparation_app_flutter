import '../models/main_category.dart';
import 'sample_data.dart';

class CategoryData {
  static final List<MainCategory> categories = [
    MainCategory(
      id: 1,
      title: 'Verbal Ability',
      icon: '🗣️',
      description: 'English, vocabulary and verbal practice',
      modules: SampleData.modules
          .where((module) => module.category == 'Verbal Ability')
          .toList(),
    ),

    MainCategory(
      id: 2,
      title: 'Quantitative Aptitude',
      icon: '🔢',
      description: 'Numbers, calculations and aptitude',
      modules: SampleData.modules
          .where((module) => module.category == 'Quantitative Aptitude')
          .toList(),
    ),

    MainCategory(
      id: 3,
      title: 'Logical Reasoning',
      icon: '🧠',
      description: 'Logic, patterns and problem solving',
      modules: SampleData.modules
          .where((module) => module.category == 'Logical Reasoning')
          .toList(),
    ),

    MainCategory(
      id: 4,
      title: 'Technical Skills',
      icon: '💻',
      description: 'Programming and computer science',
      modules: SampleData.modules
          .where((module) => module.category == 'Technical Skills')
          .toList(),
    ),

    MainCategory(
      id: 5,
      title: 'Placement & Interview',
      icon: '🎯',
      description: 'Resume, HR and interview preparation',
      modules: SampleData.modules
          .where((module) => module.category == 'Placement & Interview')
          .toList(),
    ),
  ];
}