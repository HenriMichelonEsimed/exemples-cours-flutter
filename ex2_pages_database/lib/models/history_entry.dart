class HistoryEntry {
  int? id;
  late String name;
  late DateTime date;

  HistoryEntry(this.name) {
    date = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date' : date.millisecondsSinceEpoch
    };
  }

  HistoryEntry.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    date = DateTime.fromMillisecondsSinceEpoch(map['date']);
  }

  @override
  String toString() {
    return '$date : $name';
  }
}