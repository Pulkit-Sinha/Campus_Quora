import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Vansh/navigationPage.dart';
import 'package:log_in/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return NavigationPage();
    }
  }
}
