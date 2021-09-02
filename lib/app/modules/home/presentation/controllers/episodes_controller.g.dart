// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EpisodesController on EpisodesControllerBase, Store {
  Computed<ObservableList<Episode>>? _$episodesComputed;

  @override
  ObservableList<Episode> get episodes => (_$episodesComputed ??=
          Computed<ObservableList<Episode>>(() => super.episodes,
              name: 'EpisodesControllerBase.episodes'))
      .value;

  final _$addEpisodesAsyncAction =
      AsyncAction('EpisodesControllerBase.addEpisodes');

  @override
  Future<void> addEpisodes() {
    return _$addEpisodesAsyncAction.run(() => super.addEpisodes());
  }

  @override
  String toString() {
    return '''
episodes: ${episodes}
    ''';
  }
}
