import 'package:flutter/material.dart';
import 'data/profile.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightOfScreen =
        MediaQuery.of(context).size.height; // to get the height of device.
    UserProfile user = UserProfile(
        firstname: 'N.A.',
        secondname: ' ',
        instagramId: 'N.A.',
        aboutMe:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec ante magna. Duis accumsan turpis a diam facilisis, non accumsan ligula consectetur. Suspendisse lacinia aliquet neque sed tempor. Vestibulum sit amet nunc ac urna tincidunt vestibulum in non felis. Nulla facilisi. Nam feugiat facilisis dolor, sit amet congue est rutrum sit amet.',
        degreeIn: 'N.A.',
        emailId: 'N.A.',
        graduationYear: 2024,
        hostelName: 'N.A.',
        whatsappNumber: 'N.A.',
        profilePic: 'profilepicdefault.jpg');

    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('User Profile'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${user.profilePic}'),
                  radius: heightOfScreen /
                      15, // now remaining height is height - 100
                ),
              ),
              SizedBox(
                height: heightOfScreen / 50,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[800]),
                          onPressed: () {},
                          child: Text(
                            'Posts: ${user.numberOfPosts}',
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 18),
                          )),
                      width: double.infinity,
                    ),
                    Divider(
                      height: 60,
                      color: Colors.grey[800],
                    ),
                    Container(
                      height: heightOfScreen * (0.4),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NAME',
                              style: TextStyle(
                                  color: Colors.grey, letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Row(
                              children: [
                                Text(
                                  user.firstname,
                                  style: TextStyle(
                                    color: Colors.amberAccent,
                                    letterSpacing: 2.0,
                                    fontSize: 28,
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  user.secondname,
                                  style: TextStyle(
                                    color: Colors.amberAccent,
                                    letterSpacing: 2.0,
                                    fontSize: 28,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: heightOfScreen / 50),
                            Text(
                              'Graduation Year',
                              style: TextStyle(
                                  color: Colors.grey, letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              '${user.graduationYear}',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                letterSpacing: 2.0,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              'Degree',
                              style: TextStyle(
                                  color: Colors.grey, letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              '${user.degreeIn}',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                letterSpacing: 2.0,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              'Hostel',
                              style: TextStyle(
                                  color: Colors.grey, letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              '${user.hostelName}',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                letterSpacing: 2.0,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              'About Me',
                              style: TextStyle(
                                  color: Colors.grey, letterSpacing: 2.0),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Text(
                              '${user.aboutMe}',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                letterSpacing: 2.0,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            ),
                            Divider(
                              height: 60,
                              color: Colors.grey[800],
                            ),
                            Center(
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                    color: Colors.grey, letterSpacing: 2.0),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: heightOfScreen / 50,
                                ),
                                Text(
                                  user.emailId,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightOfScreen / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: heightOfScreen / 50,
                                ),
                                Text(
                                  user.whatsappNumber,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightOfScreen / 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
