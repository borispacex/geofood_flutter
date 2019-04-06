import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      home: LoginPage(
        title: 'Firebase Auth',
      ),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHome(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email)
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.vpn_key)
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              child: Text('login'),
              color: Colors.greenAccent,
              textColor: Colors.white,
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text
                ).then(
                  (FirebaseUser user){
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => Google_Page(),
                    ));
                  }
                ).catchError(
                  (e){
                    print(e);
                  }
                );
              },
            ),
            FlatButton(
              child: Text('Register'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            VerticalDivider(),
            FlatButton(
              child: Text('Sign in'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => _pushPage(context, SignInPage()),
            ),
          ],
        ),
      ),
    );
  }
}
// funcion para ir a una pagina luego de presionar
void _pushPage(BuildContext context, Widget page){
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => page
    ),

  )
}
