import 'package:cars_app/HomePage.dart';
import 'package:cars_app/controller/facebook_login_controller.dart';
import 'package:cars_app/controller/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Login",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text("Login using google or facebook",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(
                height: 150,
              ),
              loginControls(context),
            ],
          ),
        ),
      ),
    );
  }

  loginControls(BuildContext context) {
    return Column(
      children: [
        //Google Sign Button
        MaterialButton(
          onPressed: () {
            Provider.of<GoogleSignInController>(context, listen: false)
                .login(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ), //Google Sign Button
        MaterialButton(
          onPressed: () {
            Provider.of<FacebookSignInController>(context, listen: false)
                .Login(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign in with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
