import 'package:craft_closet/view/DashboardView.dart';
import 'package:flutter/material.dart';
import 'package:craft_closet/route/RouteInitializer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craft Closet',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: DashboardView()
      ),
      routes: RouteInitializer(context).build(),
    );
  }
}