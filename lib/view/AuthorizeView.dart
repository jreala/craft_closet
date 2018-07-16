import 'package:flutter/material.dart';
import 'package:craft_closet/bloc/GoogleAuthenticationBloc.dart';
import 'package:craft_closet/model/GoogleAuthenticationModel.dart';
import 'package:craft_closet/state/GoogleAuthenticationState.dart';
import 'dart:async';

class AuthorizeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Craft Closet',
                    style: TextStyle(
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationColor: ThemeData.dark().selectedRowColor,
                      color: ThemeData.dark().accentColor,
                      fontSize: 48.0,
                    ),
                  ),
          FlutterLogo(
            size: 150.0,
            style: FlutterLogoStyle.markOnly,
          ),
          RaisedButton.icon(
              icon: Padding(
                  child:
                      Image(image: AssetImage('icons/btn_google_signin.png')),
                  padding: EdgeInsets.only(left: 0.0, right: 24.0)),
              label: Padding(
                  child: Text('Sign in with Google'),
                  padding: EdgeInsets.only(left: 0.0, right: 8.0)),
              onPressed: () {
                final GoogleAuthenticationBloc googleAuth =
                    GoogleAuthenticationBloc();
                final Stream<GoogleAuthenticationModel> stream =
                    googleAuth.handleSignIn();
                stream.listen((data) {
                  switch (data.state) {
                    case GoogleAuthenticationState.Loading:
                      break;
                    case GoogleAuthenticationState.Success:
                      break;
                    case GoogleAuthenticationState.Error:
                      break;
                  }
                });
              })
        ])));
  }
}
