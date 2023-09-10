import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthProvider.dart';
import 'professor_home_page.dart';

class ProfessorSignUpScreen extends StatefulWidget {
  @override
  _ProfessorSignUpScreenState createState() => _ProfessorSignUpScreenState();
}

class _ProfessorSignUpScreenState extends State<ProfessorSignUpScreen> {
  final AuthProvider _authProvider = AuthProvider();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    UserCredential? result = await _authProvider.signUpWithEmailPassword(email, password);
    User? user = result?.user; // Use the null-aware operator

    if (user != null) {
      // Navigate to Professor Home Page or next screen after successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfessorHomePage(userId: user.uid),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-up failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
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
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
