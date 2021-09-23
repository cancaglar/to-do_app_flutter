class NotePages {
  final String type;
  final String pageName;
  final String createdTime;

  NotePages(
      {required this.type, required this.pageName, required this.createdTime});

  NotePages.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        pageName = json['pageName'],
        createdTime = json['createdTime'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'pageName': pageName,
        'createdTime': createdTime,
      };
}
