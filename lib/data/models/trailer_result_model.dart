import 'package:movie_app/data/models/trailer_model.dart';

class TrailerResultModel {
  int? id;
  List<TrailerModel>? results;

  TrailerResultModel({this.id, this.results});

  TrailerResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <TrailerModel>[];
      json['results'].forEach((v) {
        results!.add(new TrailerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}