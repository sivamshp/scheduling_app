class SeminarRequest {
  final String userId;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String venue;
  bool confirmed;

  SeminarRequest({
    required this.userId,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.venue,
    this.confirmed = false,
  });
}
