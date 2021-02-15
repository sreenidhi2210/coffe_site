import 'package:flutter/material.dart';
import 'package:sreecoffe/services/auth.dart';
import 'package:sreecoffe/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggle;
  Register({this.toggle});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservice auth = Authservice();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  String email = '';
  String password = '';
  String error = '';
  void setStateIfMounted() {
    if (mounted)
      setState() {
        error = "enter properly heheh";
        loading = false;
      }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[200],
              elevation: 0.0,
              title: Text('sign up to sree caffe'),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggle();
                    },
                    icon: Icon(Icons.person),
                    label: Text("signin"))
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'email',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'enter proper email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'password',
                        ),
                        validator: (val) => val.length < 6 ? '6+char' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await auth.registerWithEmailAndPassword(
                                      email, password);
                              if (!mounted) return;
                              if (result == null) {
                                setStateIfMounted();
                              }
                            }
                          },
                          child: Text("register")),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )));
  }
}
