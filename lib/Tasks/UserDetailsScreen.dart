
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserListScreen.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _selectedSource = 'Facebook';
  List<String> _sources = ['Facebook', 'Instagram', 'Organic', 'Friend', 'Google'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(


            decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Source',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedSource,
                  items: _sources.map((String source) {
                    return DropdownMenuItem<String>(
                      value: source,
                      child: Text(source),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedSource = value!;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //TODO: Save user details to database or cloud storage
                      //  Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserListScreen(users: [
                        User(name: _name, email: _email, source:_selectedSource),
                        User(name: "John Doe", email: "john.doe@gmail.com", source: "Facebook"),
                        User(name: "Jane Doe", email: "jane.doe@gmail.com", source: "Instagram"),
                        User(name: "Bob Smith", email: "bob.smith@gmail.com", source: "Organic"),
                        User(name: "Alice Smith", email: "alice.smith@gmail.com", source: "Friend"),
                        User(name: "David Lee", email: "david.lee@gmail.com", source: "Google"),
                        User(name: "Sarah Kim", email: "sarah.kim@gmail.com", source: "Facebook"),
                        User(name: "Michael Brown", email: "michael.brown@gmail.com", source: "Instagram"),
                        User(name: "Emily Davis", email: "emily.davis@gmail.com", source: "Organic"),
                        User(name: "Peter Wilson", email: "peter.wilson@gmail.com", source: "Friend"),
                        User(name: "Laura Johnson", email: "laura.johnson@gmail.com", source: "Google"),

                      ],)),
                      );
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
