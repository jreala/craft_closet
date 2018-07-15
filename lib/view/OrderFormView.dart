import 'package:flutter/material.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';

class OrderFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Order Form')),
      bottomNavigationBar: NavBar(3),
    );
  }
}