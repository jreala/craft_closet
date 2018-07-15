import 'package:craft_closet/widget/AppBarWidget.dart';
import 'package:craft_closet/widget/AuthorizeCheckerWidget.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:craft_closet/view/DrawerView.dart';

class InventoryView extends StatelessWidget {
  final String _title = 'Inventory';

  @override
  Widget build(BuildContext context) {
    return AuthorizeCheckerWidget(_main());
  }

  Widget _main() {
    return Scaffold(
      appBar: AppBarWidget(_title),
      body: Center(child: Text(_title)),
      bottomNavigationBar: NavBar(1),
      drawer: DrawerView(),
    );
  }
}