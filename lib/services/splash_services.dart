import 'dart:async';

import 'package:assignfirebaseauthapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void islogin(BuildContext context){
    Timer(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

    });
  }
}