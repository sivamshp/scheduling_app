import 'package:flutter/material.dart';
import 'AuthProvider.dart';
import 'professor_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'professorsignupscreen.dart'; // Update the import path



class ProfessorLoginScreen extends StatefulWidget {
  @override
  _ProfessorLoginScreenState createState() => _ProfessorLoginScreenState();
}

class _ProfessorLoginScreenState extends State<ProfessorLoginScreen> {
  final AuthProvider _authProvider = AuthProvider();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _authProvider.signInWithEmailPassword(email, password);

    if (user != null) {
      // Navigate to Professor Home Page or next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfessorHomePage(userId: user.uid),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Professor Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signIn,
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfessorSignUpScreen()), // Add this line
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
