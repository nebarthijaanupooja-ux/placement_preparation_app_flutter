import 'package:flutter_test/flutter_test.dart';

import 'package:placement_preparation_app/app.dart';

void main() {
  testWidgets(
    'Placement Preparation app loads',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const PlacementPreparationApp(),
      );

      expect(
        find.text('Placement Preparation'),
        findsOneWidget,
      );
    },
  );
}
