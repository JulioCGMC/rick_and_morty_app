

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/episode_model.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final expectedEpisodeModel = EpisodeModel(id: 28, name: "The Ricklantis Mixup", 
    airDate: "September 10, 2017", episodeCode: "S03E07", characters: [
        "https://rickandmortyapi.com/api/character/1",
        "https://rickandmortyapi.com/api/character/2",
        "https://rickandmortyapi.com/api/character/4",
        "https://rickandmortyapi.com/api/character/8",
        "https://rickandmortyapi.com/api/character/18",
        "https://rickandmortyapi.com/api/character/22",
        "https://rickandmortyapi.com/api/character/27",
        "https://rickandmortyapi.com/api/character/43",
        "https://rickandmortyapi.com/api/character/44",
        "https://rickandmortyapi.com/api/character/48",
        "https://rickandmortyapi.com/api/character/56",
        "https://rickandmortyapi.com/api/character/61",
        "https://rickandmortyapi.com/api/character/72",
        "https://rickandmortyapi.com/api/character/73",
        "https://rickandmortyapi.com/api/character/74",
        "https://rickandmortyapi.com/api/character/78",
        "https://rickandmortyapi.com/api/character/85",
        "https://rickandmortyapi.com/api/character/86",
        "https://rickandmortyapi.com/api/character/118",
        "https://rickandmortyapi.com/api/character/123",
        "https://rickandmortyapi.com/api/character/135",
        "https://rickandmortyapi.com/api/character/143",
        "https://rickandmortyapi.com/api/character/165",
        "https://rickandmortyapi.com/api/character/180",
        "https://rickandmortyapi.com/api/character/187",
        "https://rickandmortyapi.com/api/character/206",
        "https://rickandmortyapi.com/api/character/220",
        "https://rickandmortyapi.com/api/character/229",
        "https://rickandmortyapi.com/api/character/233",
        "https://rickandmortyapi.com/api/character/235",
        "https://rickandmortyapi.com/api/character/267",
        "https://rickandmortyapi.com/api/character/278",
        "https://rickandmortyapi.com/api/character/281",
        "https://rickandmortyapi.com/api/character/283",
        "https://rickandmortyapi.com/api/character/284",
        "https://rickandmortyapi.com/api/character/287",
        "https://rickandmortyapi.com/api/character/288",
        "https://rickandmortyapi.com/api/character/289",
        "https://rickandmortyapi.com/api/character/291",
        "https://rickandmortyapi.com/api/character/292",
        "https://rickandmortyapi.com/api/character/322",
        "https://rickandmortyapi.com/api/character/325",
        "https://rickandmortyapi.com/api/character/328",
        "https://rickandmortyapi.com/api/character/345",
        "https://rickandmortyapi.com/api/character/366",
        "https://rickandmortyapi.com/api/character/367",
        "https://rickandmortyapi.com/api/character/392",
        "https://rickandmortyapi.com/api/character/472",
        "https://rickandmortyapi.com/api/character/473",
        "https://rickandmortyapi.com/api/character/474",
        "https://rickandmortyapi.com/api/character/475",
        "https://rickandmortyapi.com/api/character/476",
        "https://rickandmortyapi.com/api/character/477",
        "https://rickandmortyapi.com/api/character/478",
        "https://rickandmortyapi.com/api/character/479",
        "https://rickandmortyapi.com/api/character/480",
        "https://rickandmortyapi.com/api/character/481",
        "https://rickandmortyapi.com/api/character/482",
        "https://rickandmortyapi.com/api/character/483",
        "https://rickandmortyapi.com/api/character/484",
        "https://rickandmortyapi.com/api/character/485",
        "https://rickandmortyapi.com/api/character/486",
        "https://rickandmortyapi.com/api/character/487",
        "https://rickandmortyapi.com/api/character/488",
        "https://rickandmortyapi.com/api/character/489"
    ], 
    url: "https://rickandmortyapi.com/api/episode/28", 
    createdAt: DateTime(2017,11,10,12,56,36,618)
  );

  test("EpisodeModel deveria ser herdeira da entidade Episode", () async {
    /// Assert
    expect(expectedEpisodeModel, isA<Episode>());
  });

  group("Usando Fixtures:", () {
    test("Deveria retornar um model válido para um único episodio", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("episode.json"));
      /// Act
      final result = EpisodeModel.fromJson(map);
      /// Assert
      expect(result, isA<Episode>());
    });

    test("Deveria retornar um model válido uma lista de episodios", () async {
      /// Arrange
      final Map<String, dynamic> map = json.decode(fixture("episode_list.json"));
      expect(map['results'], isA<List>());
      
      map['results'].forEach((item) {
        /// Act
        final result = EpisodeModel.fromJson(item);
        /// Assert
        expect(result, isA<Episode>());
      });
    });
  });

  // group("toJson", () {
  //   test("Deveria verificar se o retorno é um Json", () async {
  //     /// Act
  //     final result = expectedEpisodeModel.toJson();
  //     final Map<String, dynamic> expectedJson = json.decode(fixture("episode.json"));
  //     /// Assert
  //     expect(result, expectedJson);
  //   });
  // });
}
