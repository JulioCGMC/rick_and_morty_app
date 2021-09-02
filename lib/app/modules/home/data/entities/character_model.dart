import 'package:enum_to_string/enum_to_string.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';

import 'location_model.dart';

class CharacterModel extends Character {
  CharacterModel({required int id, required String name, 
    required Status? status, required String species, required String type, 
    required Gender? gender, required LocationModel origin, 
    required LocationModel location, required String image, 
    required List<String> episodesUrl, required String url, 
    required DateTime createdAt
  }) : super(id, name, status ?? Status.unknown, species, type, 
    gender ?? Gender.unknown, origin, location, image, episodesUrl, 
  url, createdAt);

  factory CharacterModel.fromJson(Map<String,dynamic> json) {
    LocationModel or = LocationModel.fromJson(json['origin']);
    LocationModel lc = LocationModel.fromJson(json['location']);

    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: EnumToString.fromString(Status.values, json['status'].toString().toLowerCase()),
      species: json['species'],
      type: json['type'],
      gender: EnumToString.fromString(Gender.values, json['gender'].toString().toLowerCase()),
      origin: or,
      location: lc,
      image: json['image'],
      episodesUrl: json['episode'].cast<String>(),
      url: json['url'],
      createdAt: DateTime.parse(json['created'])
    );
  }
}