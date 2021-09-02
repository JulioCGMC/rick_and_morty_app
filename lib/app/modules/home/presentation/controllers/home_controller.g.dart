// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$episodesAtom = Atom(name: 'HomeControllerBase.episodes');

  @override
  ObservableList<Episode> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<Episode> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$locationsAtom = Atom(name: 'HomeControllerBase.locations');

  @override
  ObservableList<Location> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(ObservableList<Location> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  final _$charactersAtom = Atom(name: 'HomeControllerBase.characters');

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$gifsAtom = Atom(name: 'HomeControllerBase.gifs');

  @override
  ObservableList<String> get gifs {
    _$gifsAtom.reportRead();
    return super.gifs;
  }

  @override
  set gifs(ObservableList<String> value) {
    _$gifsAtom.reportWrite(value, super.gifs, () {
      super.gifs = value;
    });
  }

  final _$addLocationsAsyncAction =
      AsyncAction('HomeControllerBase.addLocations');

  @override
  Future<void> addLocations() {
    return _$addLocationsAsyncAction.run(() => super.addLocations());
  }

  @override
  String toString() {
    return '''
episodes: ${episodes},
locations: ${locations},
characters: ${characters},
gifs: ${gifs}
    ''';
  }
}
