import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'UserDetailsScreen.dart';
import 'UserListScreen.dart';

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File Picker Example',
      home: UserDetailsScreen(),
    );
  }
}


