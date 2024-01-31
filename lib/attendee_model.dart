
class Attendee {
  final String name;
  final String course;
  final String branch;
  final int year;

  Attendee({
    required this.name,
    required this.course,
    required this.branch,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'branch': branch,
      'year': year,
    };
  }
}
