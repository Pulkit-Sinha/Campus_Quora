import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Pranav/route_generator.dart';
import 'package:log_in/Screens/Wrapper.dart';
import 'package:log_in/Services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Profile?>.value(
      catchError: (_,__)=>null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
