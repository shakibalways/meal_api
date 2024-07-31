import 'package:flutter/material.dart';
import 'package:meal_cetagories/view/screen/meal_view_page.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MealViewPage(),
    );
  }
}
