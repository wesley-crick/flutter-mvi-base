import 'package:flutter/material.dart';
import 'package:flutter_demo_app/login/ui/login_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy();
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
    );
  }
}
