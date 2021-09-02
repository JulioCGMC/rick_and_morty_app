

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/location_model.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final expectedLocationModel = LocationModel(id: 13, name: "Nuptia 4",
    type: "Planet",
    dimension: "unknown",
    residents: [
        "https://rickandmortyapi.com/api/character/40",
        "https://rickandmortyapi.com/api/character/55",
        "https://rickandmortyapi.com/api/character/131",
        "https://rickandmortyapi.com/api/character/132",
        "https://rickandmortyapi.com/api/character/146",
        "https://rickandmortyapi.com/api/character/148",
        "https://rickandmortyapi.com/api/character/163",
        "https://rickandmortyapi.com/api/character/178",
        "https://rickandmortyapi.com/api/character/310",
        "https://rickandmortyapi.com/api/character/386",
        "https://rickandmortyapi.com/api/character/387"
    ],
    url: "https://rickandmortyapi.com/api/location/13",
    createdAt: DateTime(2017,11,18,11,30,29,780)
  );

  test("LocationModel deveria ser herdeira da entidade Location", () async {
    /// Assert
    expect(expectedLocationModel, isA<Location>());
  });

  group("Usando Fixtures:", () {
    test("Deveria retornar um model válido para uma única localização", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("location.json"));
      /// Act
      final result = LocationModel.fromJson(map);
      /// Assert
      expect(result, isA<Location>());
    });

    test("Deveria retornar um model válido uma lista de localizações", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("location_list.json"));
      expect(map['results'], isA<List>());
      
      map['results'].forEach((item) {
        /// Act
        final result = LocationModel.fromJson(item);
        /// Assert
        expect(result, isA<Location>());
      });
    });
  });

  // group("toJson", () {
  //   test("Deveria verificar se o retorno é um Json", () async {
  //     /// Act
  //     final result = expectedLocationModel.toJson();
  //     final Map<String, dynamic> expectedJson = json.decode(fixture("location.json"));
  //     /// Assert
  //     expect(result, expectedJson);
  //   });
  // });
}
