import 'package:flutter/material.dart';

class MakeAccount extends StatefulWidget {

  @override
  _MakeAccountState createState() => _MakeAccountState();
}

class _MakeAccountState extends State<MakeAccount> {
  @override
  Widget build(BuildContext context) {

    String dropdowndegreeValue = 'First Degree';
    String dropdowngenderValue = 'Male';
    String dropdownbranchValue = 'CSE';
    String dropdownyearValue = '2024';

    return Scaffold(
      appBar: AppBar(
        title: Text('Make Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: TextField(
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
              TextField(),
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
                child: DropdownButton(
                  value: dropdowndegreeValue,
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
                      dropdowndegreeValue = newValue!;
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
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButton(
                  value: dropdownbranchValue,
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
                      dropdownbranchValue = newValue!;
                    });
                  },
                  items: ['CSE']
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
              TextField(),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Text(
                  'Email',
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Text(
                  'Graduation Year',
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                child: DropdownButton(
                  value: dropdownyearValue,
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
                      dropdownyearValue = newValue!;
                    });
                  },
                  items: ['2024']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
