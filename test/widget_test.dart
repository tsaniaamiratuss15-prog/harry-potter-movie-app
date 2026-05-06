import 'package:flutter_test/flutter_test.dart';
import 'package:l200230106_widgets/main.dart';

void main() {

  testWidgets('App loads successfully',
      (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    expect(find.text('Home Widgets'),
        findsOneWidget);
  });
}