import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  EpisodeModel({required int id, required String name, required String airDate, 
    required String episodeCode, required List<String> characters, 
    required String url, required DateTime createdAt
  }) : super(id, name, airDate, episodeCode, characters, url, createdAt);

  factory EpisodeModel.fromJson(Map<String,dynamic> json) => EpisodeModel(
    id: json['id'],
    name: json['name'],
    airDate: json['air_date'],
    episodeCode: json['episode'],
    characters: json['characters'].cast<String>(),
    url: json['url'],
    createdAt: DateTime.parse(json['created'])
  );
}