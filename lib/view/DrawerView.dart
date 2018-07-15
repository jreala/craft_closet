import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:craft_closet/bloc/GoogleAuthenticationBloc.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Name Goes Here'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeData.dark().highlightColor,
              ),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                GoogleAuthenticationBloc().handleSignOut();
                Navigator.pop(context);
              }
            )
          ]
        ),
    );
  }
}