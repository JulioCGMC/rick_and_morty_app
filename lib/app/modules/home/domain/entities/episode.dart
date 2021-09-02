import 'package:equatable/equatable.dart';

abstract class Episode extends Equatable {
  /// The id of the episode.
  final int id;
  /// The name of the episode.
  final String name;
  /// The air date of the episode.
  final String airDate;
  /// The code of the episode.
  final String episodeCode;
  /// array (urls)	List of characters who have been seen in the episode.
  final List<String> characters;
  /// url)	Link to the episode's own endpoint.
  final String url;
  /// Time at which the episode was created in the database.
  final DateTime createdAt;

  Episode(this.id, this.name, this.airDate, this.episodeCode, 
    this.characters, this.url, this.createdAt);

  @override
  List<Object> get props => [id];
}