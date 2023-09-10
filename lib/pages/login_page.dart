import 'package:flutter/material.dart';
import 'admin_login_page.dart';
import 'professor_login_page.dart';
//import 'package:sch_app/models/seminar_request.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets4/hey.png",
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLoginPage()),
              );
            },
            child: Text('Administrator Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfessorLoginScreen()),
              );
            },
            child: Text('Professor Login'),
          ),
        ],
      ),
    );
  }
}