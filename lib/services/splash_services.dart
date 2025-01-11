import 'dart:async';

import 'package:assignfirebaseauthapp/screens/home_screen.dart';
import 'package:assignfirebaseauthapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashServices {
  void islogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
    ;
  }
}
