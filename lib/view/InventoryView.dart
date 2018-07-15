import 'package:craft_closet/widget/AuthorizeCheckerWidget.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';
import 'package:flutter/material.dart';

class InventoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthorizeCheckerWidget(_main());
  }

  Widget _main() {
    return Scaffold(
      body: Center(child: Text('Inventory')),
      bottomNavigationBar: NavBar(1),
    );
  }
}