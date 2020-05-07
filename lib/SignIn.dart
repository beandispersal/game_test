import 'package:flutter/material.dart';
import 'package:lwk/Auth_service.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('Sign In/Register'),

      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,

                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: InputDecoration(hintText: 'Email', errorStyle: TextStyle(fontSize: 20)),
                  ),
                  TextFormField(
                    validator: (val) => val.length < 8 ? 'Password must be at least 8 characters' : null,
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(hintText: 'Password', errorStyle: TextStyle(fontSize: 20)),
                    obscureText: true,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      Builder(
                        builder: (context) => RaisedButton(
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth.signIn(email,password);
                                if (result == null){
                                  setState(() {
                                    loading = false;
                                  });
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Incorrect Email/Password',textAlign: TextAlign.center,),
                                      )
                                  );
                                }
                              };
                            },
                          child: Text('Sign In')
                        ),
                      ),
                      Builder(
                        builder: (context) => RaisedButton(
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth.register(email,password);
                                if (result == null){
                                  setState(() {
                                    loading = false;
                                  });
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Please enter a valid email',textAlign: TextAlign.center,),
                                      )
                                  );
                                }
                              };
                            },
                            child: Text('Register')
                        ),
                      ),
                    ]
                  ),
                  RaisedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await _auth.signInAnon();
                      },
                      child: Text('_DEBUG_bypassSignIn')
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text('Loading'),
      ],
    ));
  }
}
