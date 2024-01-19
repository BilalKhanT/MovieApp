import 'package:equatable/equatable.dart';

class TrailerEntity extends Equatable {
  final String title;
  final String key;
  final String type;

  TrailerEntity({
    required this.title,
    required this.key,
    required this.type,
  });

  @override
  List<Object?> get props => [title];

  @override
  bool get stringify => true;

}
