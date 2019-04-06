import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formaKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControlller = TextEditingController();
  bool _success;
  String _userEmail;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Form(
         key: _formaKey,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             TextFormField(
               controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'Email'
               ),
               validator: (String value){
                 if(value.isEmpty){
                   return 'Please enter some text';
                 }
               },
             ),
             TextFormField(
               controller: _passwordControlller,
               decoration: InputDecoration(
                 labelText: 'Password'
               ),
               validator: (String value){
                 if(value.isEmpty){
                   return 'Please enter your password';
                 }
               },
             ),
             Container(
               alignment: Alignment.center,
               child: Text(
                 _success == null
                  ? ''
                  : (_success
                    ? 'Successfully registered' + _userEmail
                    : 'Registration failed'
                  )
                 ),
             )
           ],
         ),
       ),
    );
  }
  void dispose() {
    _emailController.dispose();
    _passwordControlller.dispose();
    super.dispose();
  }
  void _register() async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordControlller.text
    );
    if(user!=null){
      _success = true;
      _userEmail = user.email;
    }else{
      _success = false;
    }
  }
}