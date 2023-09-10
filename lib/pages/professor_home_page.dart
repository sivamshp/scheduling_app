import 'package:flutter/material.dart';
import 'seminar_request_page.dart';
import 'scheduled_seminars_page.dart';  // Update the import path

class ProfessorHomePage extends StatelessWidget {
  final String userId;

  ProfessorHomePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Professor Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeminarRequestPage(userId: userId),
                  ),
                );
              },
              child: Text('Request Seminar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScheduledSeminarsPage(userId: userId),
                  ),
                );
              },
              child: Text('View Scheduled Seminars'),
            ),
          ],
        ),
      ),
    );
  }
}
