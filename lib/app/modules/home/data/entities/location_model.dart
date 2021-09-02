import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({int? id, required  String name, 
    String? type, String? dimension, List<String>? residents, 
    required String url, DateTime? createdAt
  }) : super(id, name, type, dimension, residents, url, createdAt);
  
  factory LocationModel.fromJson(Map<String,dynamic> json) => LocationModel(
    id: json['id'],
    name: json['name'],
    type: json['type'],
    dimension: json['dimension'],
    residents: (json['residents'] ?? []).cast<String>(),
    url: json['url'],
    createdAt: json['created'] != null 
      ? DateTime.tryParse(json['created']) : null
  );
}