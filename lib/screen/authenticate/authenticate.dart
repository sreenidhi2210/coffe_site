import 'package:flutter/material.dart';
import 'package:sreecoffe/screen/authenticate/sign_in.dart';
import 'package:sreecoffe/screen/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignin = true;
  void toggle() {
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return Signin(toggle: toggle);
    } else {
      return Register(toggle: toggle);
    }
  }
}
