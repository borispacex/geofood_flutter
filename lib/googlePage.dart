import 'package:flutter/material.dart';

class GoogleScreen extends StatefulWidget {
  final Widget child;
  GoogleScreen({ Key key, this.child }) : super(key : key);
  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Auth'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(5.0),
            width: 400.0,
            height: 400.0,
            decoration: new BoxDecoration(
              image:  new DecorationImage(
                image: new AssetImage('assets/images/rocketspaces.gif'),
                fit: BoxFit.cover
              ),
            ),
          )
        ],
      ),
    );
  }
}