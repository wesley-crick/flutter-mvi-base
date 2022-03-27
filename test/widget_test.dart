import 'package:flutter_demo_app/core/database/object_box.dart';
import 'package:flutter_demo_app/login/ui/login_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_demo_app/main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mockito/annotations.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([ObjectBox])
void main() async {

  ObjectBox objectbox = MockObjectBox();

  testWidgets('App should launch', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(objectbox));

    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
