// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationsController on LocationsControllerBase, Store {
  Computed<ObservableList<Location>>? _$locationsComputed;

  @override
  ObservableList<Location> get locations => (_$locationsComputed ??=
          Computed<ObservableList<Location>>(() => super.locations,
              name: 'LocationsControllerBase.locations'))
      .value;

  final _$addLocationsAsyncAction =
      AsyncAction('LocationsControllerBase.addLocations');

  @override
  Future<void> addLocations() {
    return _$addLocationsAsyncAction.run(() => super.addLocations());
  }

  @override
  String toString() {
    return '''
locations: ${locations}
    ''';
  }
}
