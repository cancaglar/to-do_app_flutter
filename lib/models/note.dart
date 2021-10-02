class Note {
  final String parentPage;
  final String title;
  final String note;
  final String createdTime;
  final String type;

  const Note({
    required this.type,
    required this.parentPage,
    required this.title,
    required this.note,
    required this.createdTime,
  });
}
