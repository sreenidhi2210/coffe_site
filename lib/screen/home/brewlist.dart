import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sreecoffe/screen/home/brew.dart';
import 'package:sreecoffe/shared/brewtile.dart';
import 'package:sreecoffe/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Brewlist extends StatefulWidget {
  @override
  _BrewlistState createState() => _BrewlistState();
}

class _BrewlistState extends State<Brewlist> {
  List<Brew> brews;
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    if (brews != null && brews.length > 0) {
      return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return Brewtile(brew: brews[index]);
        },
      );
    }
  }
}
