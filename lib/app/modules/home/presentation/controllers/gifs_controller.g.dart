// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GifsController on GifsControllerBase, Store {
  Computed<ObservableList<String>>? _$gifsComputed;

  @override
  ObservableList<String> get gifs =>
      (_$gifsComputed ??= Computed<ObservableList<String>>(() => super.gifs,
              name: 'GifsControllerBase.gifs'))
          .value;

  final _$addGifsAsyncAction = AsyncAction('GifsControllerBase.addGifs');

  @override
  Future<void> addGifs() {
    return _$addGifsAsyncAction.run(() => super.addGifs());
  }

  @override
  String toString() {
    return '''
gifs: ${gifs}
    ''';
  }
}
