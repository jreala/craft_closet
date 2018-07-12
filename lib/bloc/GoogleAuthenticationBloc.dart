import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:craft_closet/model/GoogleAuthenticationModel.dart';

class GoogleAuthenticationBlock {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn(
      signInOption: SignInOption.standard,
      scopes: [
        'profile',
        'email',
        'https://www.googleapis.com/auth/gmail.send'
      ]);

  GoogleAuthenticationBlock();

  Stream<GoogleAuthenticationModel> handleSignIn() async* {
    yield GoogleAuthenticationModel(state: 'Loading');

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final FirebaseUser user = await _auth.signInWithGoogle(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );

      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      yield GoogleAuthenticationModel(state: 'Success', uid: currentUser.uid);
    } catch (error) {
      print(error);
      yield GoogleAuthenticationModel(state: 'Error');
    }
  }

  Stream<void> handleSignOut() {
    _googleSignIn.disconnect();
    return Stream.empty();
  }

  Stream<String> getUID() async* {
    final currentUser = await _auth.currentUser();
    yield currentUser.uid;
  }
}