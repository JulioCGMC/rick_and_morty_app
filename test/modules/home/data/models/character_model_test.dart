

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/character_model.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/location_model.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final expectedCharacterModel = CharacterModel(id: 128, name: "Frankenstein's Monster",
    status: Status.dead,
    species: "Alien",
    type: "Parasite",
    gender: Gender.male,
    origin: LocationModel(name: "unknown", url: ""),
    location: LocationModel(name: "Earth (Replacement Dimension)",
      url: "https://rickandmortyapi.com/api/location/20"
    ),
    image: "https://rickandmortyapi.com/api/character/avatar/128.jpeg",
    episodesUrl: [
        "https://rickandmortyapi.com/api/episode/15"
    ],
    url: "https://rickandmortyapi.com/api/character/128",
    createdAt: DateTime(2017,12,26,19,24,56,679)
  );

  test("CharacterModel deveria ser herdeira da entidade Character", () async {
    /// Assert
    expect(expectedCharacterModel, isA<Character>());
  });

  group("Usando Fixtures:", () {
    test("Deveria retornar um model válido para uma única localização", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("character.json"));
      /// Act
      final result = CharacterModel.fromJson(map);
      /// Assert
      expect(result, isA<Character>());
    });

    test("Deveria retornar um model válido uma lista de localizações", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("character_list.json"));
      expect(map['results'], isA<List>());
      
      map['results'].forEach((item) {
        /// Act
        final result = CharacterModel.fromJson(item);
        /// Assert
        expect(result, isA<Character>());
      });
    });
  });

  // group("toJson", () {
  //   test("Deveria verificar se o retorno é um Json", () async {
  //     /// Act
  //     final result = expectedCharacterModel.toJson();
  //     final Map<String, dynamic> expectedJson = json.decode(fixture("character.json"));
  //     /// Assert
  //     expect(result, expectedJson);
  //   });
  // });
}
