class Note {
  final int? id;
  final String note;
  final DateTime createdTime;
  final int pageId;

  const Note(
      {this.id,
      required this.note,
      required this.createdTime,
      required this.pageId});
}
