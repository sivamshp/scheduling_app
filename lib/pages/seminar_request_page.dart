import 'package:flutter/material.dart';
import 'package:sch_app/data.dart';
import 'package:intl/intl.dart';
import 'package:sch_app/models/seminar_request.dart';


class SeminarRequestPage extends StatefulWidget {
  final String userId;

  SeminarRequestPage({required this.userId});

  @override
  _SeminarRequestPageState createState() => _SeminarRequestPageState();
}
class _SeminarRequestPageState extends State<SeminarRequestPage> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  final TextEditingController _venueController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedStartTime)
      setState(() {
        _selectedStartTime = picked;
      });
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEndTime)
      setState(() {
        _selectedEndTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Seminar')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Request a Seminar for Professor ${widget.userId}'),
              SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(labelText: 'Date'),
                        child: Text(_selectedDate == null
                            ? 'Select Date'
                            : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectStartTime(context);
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(labelText: 'Start Time (24H)'),
                        child: Text(_selectedStartTime == null
                            ? 'Select Time'
                            : _selectedStartTime!.format(context)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _selectEndTime(context);
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(labelText: 'End Time (24H)'),
                        child: Text(_selectedEndTime == null
                            ? 'Select Time'
                            : _selectedEndTime!.format(context)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _venueController,
                decoration: InputDecoration(labelText: 'Venue'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String title = _titleController.text;
                  String venue = _venueController.text;

                  if (_selectedDate == null ||
                      _selectedStartTime == null ||
                      _selectedEndTime == null ||
                      venue.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields.')),
                    );
                    return;
                  }

                  String date = DateFormat('yyyy-MM-dd').format(_selectedDate!);
                  String startTime = _selectedStartTime!.format(context);
                  String endTime = _selectedEndTime!.format(context);

                  // Create a seminar request
                  SeminarRequest request = SeminarRequest(
                    userId: widget.userId,
                    title: title,
                    date: date,
                    startTime: startTime,
                    endTime: endTime,
                    venue: venue,
                  );

                  // Add the request to the list of pending requests
                  pendingRequests.add(request);

                  // Clear the input fields after submission
                  _titleController.clear();
                  _venueController.clear();
                  setState(() {
                    _selectedDate = null;
                    _selectedStartTime = null;
                    _selectedEndTime = null;
                  });

                  // Show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Seminar request submitted successfully!')),
                  );
                },
                child: Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
