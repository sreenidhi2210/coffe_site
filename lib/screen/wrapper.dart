import 'package:provider/provider.dart';
import 'package:sreecoffe/screen/authenticate/authenticate.dart';
//import 'package:sreecoffe/screen/authenticate/sign_in.dart';

import 'package:flutter/material.dart';
import 'package:sreecoffe/screen/home/home.dart';
import 'package:sreecoffe/user/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userd>(context);
    if (user == null) {
      return Authenticate();
    } else {
      print('Inside wrapper class, found a user');
      return Home();
    }
  }
}
