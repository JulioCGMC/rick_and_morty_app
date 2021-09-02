import 'package:equatable/equatable.dart';

import 'location.dart';

abstract class Character extends Equatable {
  /// The id of the character.
  final int id;
  /// The name of the character.
  final String name;
  /// The status of the character ('Alive', 'Dead' or 'unknown').
  final Status status;
  /// The species of the character.
  final String species;
  /// The type or subspecies of the character.
  final String type;
  /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
  final Gender gender;
  /// Name and link to the character's origin location.
  final Location origin;
  /// Name and link to the character's last known location endpoint.
  final Location location;
  /// Link to the character's image. All images are 300x300px and most are
  /// medium shots or portraits since they are intended to be used as avatars.
  final String image;
  /// List of episodes in which this character appeared.
  final List<String> episodesUrl;
  /// Link to the character's own URL endpoint.
  final String url;
  /// Time at which the character was created in the database.
  final DateTime createdAt;

  Character(this.id, this.name, this.status, this.species, this.type, 
    this.gender, this.origin, this.location, this.image, this.episodesUrl,
    this.url, this.createdAt);

  @override
  List<Object> get props => [id];
}

enum Gender { male, female, genderless, unknown }
extension GenderNames on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "Masculino";
      case Gender.female:
        return "Feminino";
      case Gender.genderless:
        return "Sem gênero";
      case Gender.unknown:
        return "Desconhecido";
    }
  }
}
enum Status { alive, dead, unknown }
extension StatusNames on Status {
  String get name {
    switch (this) {
      case Status.alive:
        return "Vivo";
      case Status.dead:
        return "Morto";
      case Status.unknown:
        return "Desconhecido";
    }
  }
}