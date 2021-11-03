import 'package:cars_app/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login(BuildContext context) async {
    this.googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    notifyListeners();
  }

  logout() async {
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}
