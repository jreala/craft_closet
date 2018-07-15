import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  AppBarWidget(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        }
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(35.0);
}