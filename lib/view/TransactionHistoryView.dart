import 'package:flutter/material.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';

class TransactionHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Transaction History')),
      bottomNavigationBar: NavBar(4),
    );
  }
}