import 'package:flutter/material.dart';
import 'package:flutter_demo_app/login/ui/login_page.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'core/database/object_box.dart';

late ObjectBox objectbox;

void main() async {
  Loggy.initLoggy();

  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
