import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_paprika/pages/home/home_page.dart';
import 'package:test_paprika/routes/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Paprika',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
