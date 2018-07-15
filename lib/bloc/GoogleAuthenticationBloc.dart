import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:craft_closet/model/GoogleAuthenticationModel.dart';
import 'package:craft_closet/state/GoogleAuthenticationState.dart';

class GoogleAuthenticationBloc {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
      signInOption: SignInOption.standard,
      scopes: [
        'profile',
        'email',
        'https://www.googleapis.com/auth/gmail.send'
      ]);

  GoogleAuthenticationBloc();

  Stream<GoogleAuthenticationModel> handleSignIn() async* {
    yield GoogleAuthenticationModel(state: GoogleAuthenticationState.Loading);

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

      yield GoogleAuthenticationModel(state: GoogleAuthenticationState.Success, uid: currentUser.uid);
    } catch (error) {
      print(error);
      yield GoogleAuthenticationModel(state: GoogleAuthenticationState.Error);
    }
  }

  Stream<void> handleSignOut() {
    _googleSignIn.disconnect();
    _auth.signOut();
    return Stream.empty();
  }

  Stream<String> getUID() async* {
    final currentUser = await _auth.currentUser();
    yield currentUser.uid;
  }
}