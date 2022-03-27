import 'package:flutter_demo_app/core/database/object_box.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_demo_app/main.dart';
import 'package:mockito/annotations.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([ObjectBox])
void main() async {

  ObjectBox objectbox = MockObjectBox();

  testWidgets('App should launch', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(objectbox));

    // Verify that our counter starts at 0.
    expect(find.text('Enter'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('Enter'));
    await tester.pump();
  });
}
