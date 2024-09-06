import 'package:ex3_front_api/model/features.dart';

class Results {
  String? type;
  String? version;
  List<Features>? features;
  String? attribution;
  String? licence;
  String? query;
  int? limit;

  Results(
      {this.type,
        this.version,
        this.features,
        this.attribution,
        this.licence,
        this.query,
        this.limit});

  Results.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    attribution = json['attribution'];
    licence = json['licence'];
    query = json['query'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['version'] = this.version;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['attribution'] = this.attribution;
    data['licence'] = this.licence;
    data['query'] = this.query;
    data['limit'] = this.limit;
    return data;
  }
}



