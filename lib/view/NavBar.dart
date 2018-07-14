import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Map<IconData, String> _icons;

  NavBar(this._icons);

  List<BottomNavigationBarItem> _buildBottomBar() {
    final list = new List<BottomNavigationBarItem>();

    _icons.forEach((icon, text) {
      print(text);
      final item = BottomNavigationBarItem(
        icon: new Icon(icon),
        title: new Text(text)
      );

      list.add(item);
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(items: _buildBottomBar());
  }
}