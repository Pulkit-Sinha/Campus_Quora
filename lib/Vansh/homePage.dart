import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          title: Text(
            "Home",
          ),
        ),
        body: Text("Main Page"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Profile',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications_rounded),
              label: "Notifications",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Following",
              backgroundColor: Colors.red,
            ),
          ],
          // backgroundColor: Colors.black,
        ),
      );
  }
}