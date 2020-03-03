import 'package:flutter/material.dart';
import 'package:otobox/src/database/db_helper.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DbHelper dbHelper;
  TextEditingController feedbackController = new TextEditingController();

  @override
  void initState() {
    dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEF4F3),
        body: Center(
          child: Text('Profile Page'),
        ));
  }
}
