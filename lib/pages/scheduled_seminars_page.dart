import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sch_app/models/seminar_request.dart';
import 'package:sch_app/data.dart';


class ScheduledSeminarsPage extends StatelessWidget {
  final String userId;

  ScheduledSeminarsPage({required this.userId});

  // Simulated list of confirmed seminars
  List<SeminarRequest> confirmedSeminars = [];

  @override
  Widget build(BuildContext context) {
    // Filter and populate confirmed seminars
    confirmedSeminars = pendingRequests.where((request) => request.confirmed).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Scheduled Seminars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scheduled Seminars for Professor $userId'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: confirmedSeminars.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seminar Name: ${confirmedSeminars[index].title}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text('Date: ${confirmedSeminars[index].date}'),
                        SizedBox(height: 5),
                        Text('Time: ${confirmedSeminars[index].startTime} - ${confirmedSeminars[index].endTime}'),
                        SizedBox(height: 5),
                        Text('Venue: ${confirmedSeminars[index].venue}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
