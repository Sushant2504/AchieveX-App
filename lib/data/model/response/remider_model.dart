
class Reminder {
  final String title;
  final String description;
  final DateTime time;
  final DateTime end_time;
  String? id;

  Reminder({required this.title, required this.description, required this.time,required this.end_time, this.id });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'time': time.toIso8601String(),
      'end_time':end_time.toIso8601String(),
      'id': id,
    };
  }
}