import 'package:flutter/material.dart';

class LoginSuccessPage extends StatelessWidget {

  final Map<String, dynamic> json;

  LoginSuccessPage({Key key, @required this.json}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Material(
        child: new Center(
          child: new Text(json.toString()),
        ),
      ),
    );
  }
}