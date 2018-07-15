import 'package:flutter/material.dart';
import 'package:craft_closet/route/RouteInitializer.dart';

class NavBar extends StatelessWidget {
  final int index;
  final Map<IconData, String> _icons = Map.from({
    Icons.dashboard: 'Dashboard',
    Icons.list: 'Inventory',
    Icons.attach_money: 'Invoice',
    Icons.assignment: 'Order Form',
    Icons.history: 'History',
  });

  NavBar(this.index);

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      items: _buildBottomBar(),
      currentIndex: index,
      type: BottomNavigationBarType.shifting,
      onTap: (value) {
        if(value == index) {
          return;
        }

        Navigator.of(context).pushNamed(RouteInitializer.getRoute(value));
      }
    );
  }

  List<BottomNavigationBarItem> _buildBottomBar() {
    final list = new List<BottomNavigationBarItem>();

    _icons.forEach((icon, text) {
      final item = BottomNavigationBarItem(
        icon: new Icon(icon),
        title: new Text(text),
      );

      list.add(item);
    });

    return list;
  }
}