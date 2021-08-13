import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/auth.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/authenticate/authenticate.dart';
import 'package:log_in/authenticate/register.dart';
import 'package:provider/provider.dart';

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
  String whatsappNumber = '';
  String instagramId = '';
  String profilePic = 'profilepicdefault.jpg';
  int numberOfPosts = 0;

  final _formKey = GlobalKey<FormState>();

  String dropdowndegreeValue = 'Type of Degree';
  String dropdowngenderValue = 'Gender';
  String dropdownbranchValue = 'Branch';
  String dropdownyearValue = '2024';

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
                SizedBox(height: 30),
                Container(
                  height: 150,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ),
                SizedBox(height: 10),
                Text('Add image'),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Name',
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
                        validator: (val) =>
                            val!.isEmpty ? 'second name cannot be empty' : null,
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
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Enter BitsId in 20xxAxxxxxP' : null,
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
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    value: dropdowndegreeValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
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
                    items: ['Type of Degree','First Degree', 'Higher Degree', 'PhD']
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
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: DropdownButton(
                    value: dropdowngenderValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdowngenderValue = newValue!;
                      });
                    },
                    items: ['Gender','Male', 'Female', 'Other']
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
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    
                    value: dropdownbranchValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    isExpanded: true,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
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
                    items: ['Branch','CSE', 'EEE', 'ME', 'Chem.', 'Civil', 'B.Pharm']
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
                    'Contact Number',
                    textAlign: TextAlign.left,
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    whatsappNumber = val;
                  },
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter a contact number' : null,
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Email',
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
                      onPressed: () {
                        null;
                      },
                      child: Text('Cancel')),
                    Flexible(child: SizedBox(),
                    fit: FlexFit.tight,),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await DatabaseService(uid: user!.uid).updateUserProfile(
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
}
