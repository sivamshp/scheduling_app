import 'package:flutter/material.dart';
import 'package:sch_app/data.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Administrator Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seminar Requests for Review'),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pendingRequests.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pendingRequests[index].title),
                  subtitle: Text('Professor: ${pendingRequests[index].userId}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Approve the seminar request
                          setState(() {
                            pendingRequests[index].confirmed = true;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Seminar request approved!')),
                          );
                        },
                        child: Text('Approve'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Reject the seminar request
                          setState(() {
                            pendingRequests.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Seminar request rejected.')),
                          );
                        },
                        child: Text('Reject'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

