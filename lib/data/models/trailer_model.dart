import 'package:movie_app/domain/entities/trailer_entity.dart';

class TrailerModel extends TrailerEntity{
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String publishedAt;
  String id;

  TrailerModel(
      {required this.iso6391,
        required this.iso31661,
        required this.name,
        required this.key,
        required this.site,
        required this.size,
        required this.type,
        required this.official,
        required this.publishedAt,
        required this.id}) : super(
    title: name,
    key: key,
    type: type,
  );

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      iso6391 : json['iso_639_1'],
      iso31661 : json['iso_3166_1'],
      name : json['name'],
      key : json['key'],
      site : json['site'],
      size : json['size'],
      type : json['type'],
      official : json['official'],
      publishedAt : json['published_at'],
      id : json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['key'] = this.key;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    data['official'] = this.official;
    data['published_at'] = this.publishedAt;
    data['id'] = this.id;
    return data;
  }
}