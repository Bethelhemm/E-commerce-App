import 'package:book_store/widgets/config.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

List<Genre> genresFromJson(dynamic str) =>
    List<Genre>.from((str).map((e) => Genre.fromJson(e)));

@freezed
abstract class Genre with _$Genre {
  factory Genre({
    required String GenreName,
    required String? GenreImage,
    required String GenreId,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

extension GenreExt on Genre {
  String get fullImagePath => Config.apiURL + GenreImage!;
}
