import 'package:firebase_auth/firebase_auth.dart';
import 'package:craft_closet/view/AuthorizeView.dart';
import 'package:flutter/material.dart';

class AuthorizeCheckerWidget extends StatelessWidget {
  final Widget _view;

  AuthorizeCheckerWidget(this._view);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData) {
            // If e-mail signed in
            if(snapshot.data.providerData.length == 1) {
              return snapshot.data.isEmailVerified ? _view : AuthorizeWidget();
            }

            // Other provider sign in.  Google, Facebook, GitHub, etc.
            if(snapshot.data.providerData.length > 1) {
              return _view;
            }
          }

          return AuthorizeWidget();
        }
    );
  }
}