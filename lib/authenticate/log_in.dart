import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:log_in/Services/auth.dart';
import 'package:log_in/shared/constants.dart';
import 'package:log_in/shared/loading.dart';

class LogInPage extends StatefulWidget {
  Function toggleView;
  LogInPage({required this.toggleView});
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late String email;
  late String password;
  String error = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool obsecurePassword = true;

  bool isLogin = true;
  void checkLoginStatus(BuildContext context) {
    //steps to check if LogIn info is correct
    if (isLogin == true) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/navigationPage', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? Loading()
        : Scaffold(
          backgroundColor: Colors.black12,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Log In',style: TextStyle(color: Colors.white),),
                            TextFormField(
                              onChanged: (enteredEmail) {
                                email = enteredEmail;
                              },
                              decoration:
                                  textInputDecoration.copyWith(hintText: 'Email'),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
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
                              validator: (val) => val!.length < 6
                                  ? 'Password must have atleast 6 characters'
                                  : null,
                              obscureText: obsecurePassword,
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
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result = await _auth
                                        .signInWithEmailAndPassword(email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Could not sign with those credentials';
                                      });
                                    }

                                    //if user gets a succesful result then ...(to be completed)
                                  }
                                },
                                child: Text('Login')),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                minimumSize: Size(double.infinity, 50),
                              ),
                              onPressed: ()async {
                                setState(() {
                                      loading = true;
                                    });
                                    dynamic result = await _auth.googleLogin();

                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Could not sign with those credentials';
                                      });
                              }},
                              icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
                              label: Text('Sign Up With Google'),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  widget.toggleView();
                                },
                                child: Text(
                                  'Don\'t have an account? Sign up here.',
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
