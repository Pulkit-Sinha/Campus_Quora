import 'package:flutter/material.dart';
import 'package:log_in/Services/auth.dart';
import 'package:log_in/shared/constants.dart';
import 'package:log_in/shared/loading.dart';

class Register extends StatefulWidget {
  Function toggleView;
  Register({required this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Sign up'),
              // actions: [
              //   TextButton(
              //     onPressed: () {
              //       widget.toggleView();
              //     },
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.person,
              //           color: Colors.black,
              //         ),
              //         SizedBox(
              //           width: 4,
              //         ),
              //         Text(
              //           'Sign In',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ],
              //     ),
              //   )
              // ]
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Email'),
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (val) => val!.length < 6
                                    ? 'Password must have atleast 6 characters'
                                    : null,
                                obscureText: obsecurePassword,
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obsecurePassword = !obsecurePassword;
                                        });
                                      },
                                      icon: Icon(Icons.lock)),
                                ),
                                onChanged: (val) {
                                  password = val;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    //validate goes to each function in the text field and if it gets null from all validate function only then the form is validate.
                                    //if validate doesnt recieve null then the returned string will appear as helper text.

                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'please supply valid email';
                                        loading = false;
                                      });
                                    }
                                    //if user gets a succesful result then automatically they will be redirected to home page bcz we already have setup the authchange method.
                                  }
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.pink[400]),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    'Already have an account? Sign in here',
                                  ))
                            ],
                          ))),
                ],
              ),
            ),
          );
  }
}
