class Properties {
  String? label;
  double? score;
  String? id;
  String? name;
  String? postcode;
  String? citycode;
  double? x;
  double? y;
  String? city;
  String? context;
  String? type;
  double? importance;
  String? street;

  Properties(
      {this.label,
        this.score,
        this.id,
        this.name,
        this.postcode,
        this.citycode,
        this.x,
        this.y,
        this.city,
        this.context,
        this.type,
        this.importance,
        this.street});

  Properties.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    score = json['score'];
    id = json['id'];
    name = json['name'];
    postcode = json['postcode'];
    citycode = json['citycode'];
    x = json['x'];
    y = json['y'];
    city = json['city'];
    context = json['context'];
    type = json['type'];
    importance = json['importance'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['score'] = this.score;
    data['id'] = this.id;
    data['name'] = this.name;
    data['postcode'] = this.postcode;
    data['citycode'] = this.citycode;
    data['x'] = this.x;
    data['y'] = this.y;
    data['city'] = this.city;
    data['context'] = this.context;
    data['type'] = this.type;
    data['importance'] = this.importance;
    data['street'] = this.street;
    return data;
  }
}
