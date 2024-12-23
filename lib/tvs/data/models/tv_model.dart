import 'package:movies_app/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.name,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        name: json['name'],
      );
}
