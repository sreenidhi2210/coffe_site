import 'package:flutter/material.dart';
import 'package:sreecoffe/screen/home/brew.dart';

class Brewtile extends StatelessWidget {
  final Brew brew;
  Brewtile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown[brew.strength],
              radius: 25,
            ),
            title: Text(brew.name),
            subtitle: Text('Takes $brew.sugars sugars'),
          )),
    );
  }
}
