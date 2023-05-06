import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final List<User> users;

  UserListScreen({required this.users});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;
  }

  void filterUsers(String query, String selectedOption) {
    setState(() {

      filteredUsers = widget.users.where((user) {
        final nameMatch = user.name.toLowerCase().contains(query.toLowerCase());
        final emailMatch = user.email.toLowerCase().contains(query.toLowerCase());
        final sourceMatch = user.source == selectedOption ;

        return (nameMatch || emailMatch) || sourceMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => filterUsers(value, _selectedOption),
              decoration: InputDecoration(
                hintText: 'Search by name or email',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: DropdownButton<String>(
              value: _selectedOption,
              items: _dropDownMenuItems,
              onChanged:
                  (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  _selectedOption = value!;
                });
                filterUsers(_searchQuery, value!);
              },

            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredUsers[index].name),
                  subtitle: Text('${filteredUsers[index].email} - ${filteredUsers[index].source}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _searchQuery = '';
  String _selectedOption = 'All';

  List<DropdownMenuItem<String>> _dropDownMenuItems = [
    DropdownMenuItem(
      value: 'All',
      child: Text('All'),
    ),
    DropdownMenuItem(
      value: 'Facebook',
      child: Text('Facebook'),
    ),
    DropdownMenuItem(
      value: 'Instagram',
      child: Text('Instagram'),
    ),
    DropdownMenuItem(
      value: 'Organic',
      child: Text('Organic'),
    ),
    DropdownMenuItem(
      value: 'Friend',
      child: Text('Friend'),
    ),
    DropdownMenuItem(
      value: 'Google',
      child: Text('Google'),
    ),
  ];
}

class User {
  final String name;
  final String email;
  final String source;

  User({required this.name, required this.email, required this.source});
}
