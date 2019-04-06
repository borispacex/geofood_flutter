import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

// stflbldr
class SignInPage extends StatefulWidget {
  final String title = 'Registration';

  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
         actions: <Widget>[
           Builder(
             builder: (BuildContext context){
               return FlatButton(
                 child: const Text('Sign out/Desconectar'),
                 onPressed: () async {
                   final FirebaseUser user = await _auth.currentUser();
                   if(user == null){
                     Scaffold.of(context).showSnackBar(SnackBar(
                       content: const Text('No one hast signed in'),
                     ));
                   }
                   _signOut(); // metodo
                   final String uid = user.uid;
                   Scaffold.of(context).showSnackBar(SnackBar(
                     content: Text(uid + ' has succesfully signed out'),
                   ));
                 },
               )
             },
           )
         ],
       ),
       body: Builder(
         builder: (BuildContext context){
           return ListView(
             scrollDirection: Axis.vertical,
             children: <Widget>[
               _GoogleSignInSection(),
             ]
           )
         },
    );
  }
}
// funcion para salir
void _signOut() async {
  await _auth.signOut();
}

class _GoogleSignInSection extends StatefulWidget {
  State<StatefulWidget> createState() => __GoogleSignInSectionState();
}

class __GoogleSignInSectionState extends State<_GoogleSignInSection> {
  bool _success;
  String _userId;
  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Container(
           child: const Text('Test sign in with Google'),
           padding: const EdgeInsets.all(15),
           alignment: Alignment.center,
         ),
         Container(
           padding: const EdgeInsets.symmetric(vertical: 15.0),
           alignment: Alignment.center,
           child: Column(
             children: <Widget>[
               GoogleSignInButton(
                 onPressed: (){
                   _signInWithGoogle();
                 },
                 darkMode: true,
               )
             ],
           ),
         )
       ],
    );
  }
  // metodo
  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.displayName != null);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(
      (){
        if(user != null){
          _success = true;
          _userId = user.uid;
          Navigator.of(context).pushReplacement(CupertinoPageRoute( // me direcciona a googlePage
            builder: (context) => MainGoogle(),

          ));
        }
      }
    );
  }
}


