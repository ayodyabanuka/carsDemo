import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Google SignIn
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Facebook SignIn
  Future<UserCredential> signInWithFacebook() async {
    final AccessToken result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  //SignOut
  void signOut() {
    auth.signOut();
  }
}
