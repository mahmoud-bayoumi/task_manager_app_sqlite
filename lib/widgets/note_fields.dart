class NoteFields {
  static const String tableName = 'notes';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = 'id';
  static const String title = 'title';
  static const String subtitle = 'subtitle';
  static const String description = 'describ';

  static const List<String> values = [
    id,
    title,
    subtitle,
    description,
  ];
}
