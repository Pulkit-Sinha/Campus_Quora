import 'package:flutter/material.dart';
import 'package:log_in/Pranav/HomePage.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Pranav/userprofileScreen.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  PageController _pageController = PageController();
  
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    List<Widget> _screens = [
    HomePage(),
    UserProfilePage(useruid: user!.uid,),
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Notifications'),
    //   ),
    // ),
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Following'),
    //   ),
    // ),
  ];
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.filter_alt),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      // ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
              backgroundColor: Colors.blue),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.circle_notifications_rounded),
          //   label: "Notifications",
          //   backgroundColor: Colors.blue,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group),
          //   label: "Following",
          //   backgroundColor: Colors.blue,
          // ),
        ],

        // backgroundColor: Colors.black,
      ),
    );
  }
}
