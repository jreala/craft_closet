import 'package:flutter/material.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';
import 'package:craft_closet/widget/AuthorizeCheckerWidget.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthorizeCheckerWidget(_main());
  }

  Widget _main() {
    return Scaffold(
      body: Center(child: Text('Dashboard')),
      bottomNavigationBar: NavBar(0),
    );
  }
}