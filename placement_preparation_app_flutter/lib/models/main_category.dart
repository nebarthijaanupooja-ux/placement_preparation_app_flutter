import 'module.dart';

class MainCategory {
  final int id;
  final String title;
  final String icon;
  final String description;
  final List<PlacementModule> modules;

  const MainCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.modules,
  });
}