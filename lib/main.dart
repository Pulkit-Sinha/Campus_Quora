import 'package:flutter/material.dart';
import 'package:log_in/Pranav/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute:RouteGenerator.generateRoute,
      // routes: {
      //   '/':(context)=>LogInPage(),
      //   '/makeAccount':(context)=>MakeAccount(),
      //   '/userProfilePage':(context)=>UserProfilePage(),
      //   '/navigationPage':(context)=>NavigationPage(),
      //   '/homePage':(context)=>HomePage(),
      // },
    );
  }
}
