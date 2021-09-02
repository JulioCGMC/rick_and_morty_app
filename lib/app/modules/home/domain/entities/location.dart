import 'package:equatable/equatable.dart';

abstract class Location extends Equatable {
  /// The id of the location.
  final int? id;
  /// The name of the location.
  final String name;
  /// The type of the location.
  final String? type;
  /// The dimension in which the location is located.
  final String? dimension;
  /// List of character who have been last seen in the location.
  final List<String>? residents;
  /// Link to the location's own endpoint.
  final String url;
  /// Time at which the location was created in the database.
  final DateTime? createdAt;

  Location(this.id, this.name, this.type, this.dimension, 
    this.residents, this.url, this.createdAt);

  @override
  List<Object> get props => [id ?? name];
}