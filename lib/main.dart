import 'package:flutter/material.dart';
import 'package:flutter_demo_app/login/ui/login_page.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'core/database/object_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ObjectBox objectbox = await ObjectBox.create();

  runApp(MyApp(objectbox));
}

class MyApp extends StatelessWidget {
  final ObjectBox objectbox;

  MyApp(this.objectbox, {Key? key}) : super(key: key) {
    Loggy.initLoggy();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        LoginPage().getPage(),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ObjectBox>(() => objectbox);
      }),
    );
  }
}
