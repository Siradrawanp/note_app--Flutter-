class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime time;
  Note({
    this.id,
    required this.title,
    required this.description,
    required this.time,
  });
}
