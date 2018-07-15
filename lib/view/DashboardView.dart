import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:craft_closet/widget/NavBarWidget.dart';
import 'package:craft_closet/bloc/GoogleAuthenticationBloc.dart';
import 'package:craft_closet/model/GoogleAuthenticationModel.dart';
import 'package:craft_closet/state/GoogleAuthenticationState.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          // If e-mail signed in
          if(snapshot.data.providerData.length == 1) {
            return snapshot.data.isEmailVerified ? _main() : _authorize();
          }

          // Other provider sign in.  Google, Facebook, GitHub, etc.
          if(snapshot.data.providerData.length > 1) {
            return _main();
          }
        }

        return _authorize();
      }
    );
  }

  Widget _main() {
    return Scaffold(
      body: Center(child: Text('Dashboard')),
      bottomNavigationBar: NavBar(0),
    );
  }

  Widget _authorize() {
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