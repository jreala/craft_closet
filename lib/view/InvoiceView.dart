import 'package:craft_closet/widget/NavBarWidget.dart';
import 'package:flutter/material.dart';

class InvoiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Invoice')),
      bottomNavigationBar: NavBar(2),
    );
  }
}