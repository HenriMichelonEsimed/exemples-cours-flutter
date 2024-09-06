class Favorite {
  late String label;
  late String? context;

  Favorite(this.label, this.context);

  Favorite.fromMap(Map<String, dynamic> json) {
    label = json['label'];
    context = json['context'];
  }

  Map<String, dynamic> toMap() => {
    'label' : label,
    'context' : context,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Favorite &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}