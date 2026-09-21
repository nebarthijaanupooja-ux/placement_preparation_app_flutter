import '../models/module.dart';

import 'verbal_modules.dart';
import 'quantitative_modules.dart';
import 'logical_modules.dart';
import 'technical_modules.dart';
import 'placement_modules.dart';

class SampleData {
  static const List<PlacementModule> modules = [
    ...VerbalModules.modules,
    ...QuantitativeModules.modules,
    ...LogicalModules.modules,
    ...TechnicalModules.modules,
    ...PlacementModules.modules,
  ];
}