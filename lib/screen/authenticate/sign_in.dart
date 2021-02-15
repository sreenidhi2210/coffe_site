import 'package:sreecoffe/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:sreecoffe/shared/loading.dart';

class Signin extends StatefulWidget {
  final Function toggle;
  Signin({this.toggle});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final Authservice auth = Authservice();
  final formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  String email = '';
  String password = '';
  String error = '';

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[200],
              elevation: 0.0,
              title: Text('sign in'),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      print("Pressed the button for sign-in");
                      widget.toggle();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
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
                              dynamic result = await auth
                                  .signinWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = "couldn't signin ";
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Text("sign in")),
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
