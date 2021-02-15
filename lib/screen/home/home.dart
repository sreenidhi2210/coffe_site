import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreecoffe/screen/home/brew.dart';
import 'package:sreecoffe/screen/home/settingform.dart';
import 'package:sreecoffe/services/auth.dart';
import 'package:sreecoffe/services/database.dart';
import 'package:sreecoffe/screen/home/brewlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final Authservice auth = Authservice();

  @override
  Widget build(BuildContext context) {
    void _showsetting() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Settingform());
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      // return Container(
      child: Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.brown[200],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                  onPressed: () async {
                    await Authservice().signout();
                  },
                  icon: Icon(Icons.person),
                  label: Text('logout')),
              TextButton.icon(
                  icon: Icon(Icons.settings),
                  label: Text('settings'),
                  onPressed: () {
                    _showsetting();
                  }),
            ],
          ),
          body: Brewlist()),
    );
  }
}
