import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/auth.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/authenticate/authenticate.dart';
import 'package:log_in/authenticate/register.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MakeAccount extends StatefulWidget {
  @override
  _MakeAccountState createState() => _MakeAccountState();
}

class _MakeAccountState extends State<MakeAccount> {
  final AuthService _auth = AuthService();
  bool loading = false;
  String emailId = '';
  String password = '';
  String error = '';
  String firstname = '';
  String secondname = '';
  String BitsId = '';
  String graduationYear = '';
  String degreeIn = '';
  String hostelName = '';
  String aboutMe = '';
  String whatsappNumber = 'not provided';
  String instagramId = '';
  String profilePic =
      'https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg';
  int numberOfPosts = 0;

  final _formKey = GlobalKey<FormState>();

  String dropdowndegreeValue = 'Type of Degree';
  String dropdowngenderValue = 'Gender';
  String dropdownbranchValue = 'Branch';
  String dropdownyearValue = '2024';

  List<String> imageList = [
    'https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg',
    'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58482.jpg',
    'https://pbs.twimg.com/profile_images/1252530714098237440/aY3WYZOH_400x400.jpg',
    'https://avatarfiles.alphacoders.com/103/103875.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8FQDTf2WX-mXb_PD0UQl65Xfp3mSvFOrLbA&usqp=CAU',
    'https://cdn3.iconfinder.com/data/icons/avatars-15/64/_Ninja-2-512.png',
    'https://cdn1.iconfinder.com/data/icons/avatars-55/100/avatar_profile_user_music_headphones_shirt_cool-512.png',
    'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?size=338&ext=jpg',
    'https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-370-456322-512.png',
    'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg',
    'https://i.pinimg.com/originals/6e/aa/af/6eaaaf349ca9a412253ff3af1eda27c5.jpg',
    'https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-9.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5c5K60TwIXp0ApigfdU98E3IexnnDT75bbQ&usqp=CAU',
    'https://cdn.statically.io/img/avatarfiles.alphacoders.com/166/166996.jpg',
    'https://cutewallpaper.org/21/anime-1080-x-1080/My-Hero-Academia-Forum-Avatar-Profile-Photo-ID-92257-.png',
    'https://avatarfiles.alphacoders.com/248/248955.jpg',
    'https://avatarfiles.alphacoders.com/114/114853.png',
    'https://avatarfiles.alphacoders.com/951/thumb-1920-95106.jpg',
    'https://avatarfiles.alphacoders.com/226/226110.png',
    'https://alrigh.com/wp-content/uploads/2020/06/23-Nezuko-profile-picture.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.black,
                      period: Duration(seconds: 4),
                      child: Text(
                        'Welcome to QBits!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    Text(
                      'A platform to answer all BITS Queries',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )
                    
                    
                  ],
                ),
                SizedBox(height: 30),
                ClipOval(
                  child: Image.network(
                    profilePic,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Select Avatar',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  child: DropdownButtonFormField(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    value: imageList[0],
                    hint: Text('Choose an image as avatar'),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? newValue) {
                      setState(() {
                        profilePic = newValue!;
                      });
                    },
                    items:
                        imageList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Image.network(
                          value,
                          width: 250,
                          height: 150,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'first name cannot be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            firstname = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            secondname = val;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'BITS ID',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Enter BitsId in 20xxxxxxxxP' : null,
                    onChanged: (val) {
                      setState(() {
                        BitsId = val;
                      });
                    }),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Degree',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    validator: (val) =>
                        val == null ? "Please mention your degree" : null,
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    hint: Text("type of degree"),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdowndegreeValue = newValue!;
                        //degreeIn = newValue;
                      });
                    },
                    items: ['First Degree', 'Higher Degree', 'PhD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Gender',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButton(
                    hint: Text("Gender"),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdowngenderValue = newValue!;
                      });
                    },
                    items: ['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Branch',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    validator: (val) =>
                        val == null ? "Please mention your branch" : null,
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    hint: Text("Branch"),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.purple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownbranchValue = newValue!;
                        degreeIn = newValue;
                      });
                    },
                    items: [
                      'CSE',
                      'EEE',
                      'ENI',
                      'Mechanical',
                      'Manufacturing',
                      'ECE',
                      'Chemical',
                      'Civil',
                      'B.Pharm'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Contact Number',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    whatsappNumber = val;
                  },
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter email' : null,
                  onChanged: (val) {
                    emailId = val;
                  },
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'About Me',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty
                      ? 'Please tell something about yourself..anything will work'
                      : null,
                  onChanged: (val) {
                    aboutMe = val;
                  },
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Graduation Year',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   child: DropdownButton(
                //     value: dropdownyearValue,
                //     icon: const Icon(Icons.arrow_downward),
                //     iconSize: 24,
                //     isExpanded: true,
                //     elevation: 16,
                //     style: const TextStyle(color: Colors.deepPurple),
                //     underline: Container(
                //       height: 2,
                //       color: Colors.deepPurpleAccent,
                //     ),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropdownyearValue = newValue!;
                //       });
                //     },
                //     items:
                //         ['2024'].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //   ),
                // ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'Enter Graduation Year' : null,
                  onChanged: (val) {
                    graduationYear = val;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          await alertDialog(context);
                        },
                        child: Text('Cancel')),
                    Flexible(
                      child: SizedBox(),
                      fit: FlexFit.tight,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await DatabaseService(uid: user!.uid)
                                .updateUserProfile(
                                    firstname: firstname,
                                    secondname: secondname,
                                    instagramId: instagramId,
                                    aboutMe: aboutMe,
                                    degreeIn: degreeIn,
                                    BitsId: BitsId,
                                    graduationYear: graduationYear,
                                    hostelName: hostelName,
                                    whatsappNumber: whatsappNumber,
                                    profilePic: profilePic,
                                    firstLogin: false,
                                    emailId: emailId,
                                    numberOfPosts: 0);
                          }
                        },
                        child: Text('Make Account')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Confirm'),
              content: Text(
                  'The account will be deleted along with all the changes made'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.currentUser!.delete();
                    } catch (e) {
                      FirebaseAuth.instance.signOut();
                    }
                    Navigator.pop(context, 'Confirm');
                  },
                  child: Text('Confirm'),
                )
              ]);
        });
  }
}
