// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersController on CharactersControllerBase, Store {
  Computed<ObservableList<Character>>? _$charactersComputed;

  @override
  ObservableList<Character> get characters => (_$charactersComputed ??=
          Computed<ObservableList<Character>>(() => super.characters,
              name: 'CharactersControllerBase.characters'))
      .value;

  final _$addCharactersAsyncAction =
      AsyncAction('CharactersControllerBase.addCharacters');

  @override
  Future<void> addCharacters() {
    return _$addCharactersAsyncAction.run(() => super.addCharacters());
  }

  @override
  String toString() {
    return '''
characters: ${characters}
    ''';
  }
}
