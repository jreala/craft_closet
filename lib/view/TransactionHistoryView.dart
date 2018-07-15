import 'package:craft_closet/widget/AuthorizeCheckerWidget.dart';
import 'package:flutter/material.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';

class TransactionHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthorizeCheckerWidget(_main());
  }

  Widget _main() {
    return Scaffold(
      body: Center(child: Text('Transaction History')),
      bottomNavigationBar: NavBar(4),
    );
  }
}