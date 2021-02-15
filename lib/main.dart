import 'package:flutter/material.dart';
import 'package:sreecoffe/screen/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sreecoffe/services/auth.dart';
import 'package:sreecoffe/user/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userd>.value(
        value: Authservice().user, child: MaterialApp(home: Wrapper()));
  }
}
