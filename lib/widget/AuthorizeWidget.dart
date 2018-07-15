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
          child: Column(children: <Widget>[
            Text('Craft Closet'),
            Text('Login With Google'),
            RaisedButton(
                onPressed: () {
                  final GoogleAuthenticationBloc googleAuth = GoogleAuthenticationBloc();
                  final Stream<GoogleAuthenticationModel> stream = googleAuth.handleSignIn();
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
                }
            )
          ]
          ),
        )
    );
  }
}