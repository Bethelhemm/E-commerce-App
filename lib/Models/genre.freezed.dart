// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  String get GenreName => throw _privateConstructorUsedError;
  String get GenreImage => throw _privateConstructorUsedError;
  String get GenreId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({String GenreName, String GenreImage, String GenreId});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? GenreName = null,
    Object? GenreImage = null,
    Object? GenreId = null,
  }) {
    return _then(_value.copyWith(
      GenreName: null == GenreName
          ? _value.GenreName
          : GenreName // ignore: cast_nullable_to_non_nullable
              as String,
      GenreImage: null == GenreImage
          ? _value.GenreImage
          : GenreImage // ignore: cast_nullable_to_non_nullable
              as String,
      GenreId: null == GenreId
          ? _value.GenreId
          : GenreId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$_GenreCopyWith(_$_Genre value, $Res Function(_$_Genre) then) =
      __$$_GenreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String GenreName, String GenreImage, String GenreId});
}

/// @nodoc
class __$$_GenreCopyWithImpl<$Res> extends _$GenreCopyWithImpl<$Res, _$_Genre>
    implements _$$_GenreCopyWith<$Res> {
  __$$_GenreCopyWithImpl(_$_Genre _value, $Res Function(_$_Genre) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? GenreName = null,
    Object? GenreImage = null,
    Object? GenreId = null,
  }) {
    return _then(_$_Genre(
      GenreName: null == GenreName
          ? _value.GenreName
          : GenreName // ignore: cast_nullable_to_non_nullable
              as String,
      GenreImage: null == GenreImage
          ? _value.GenreImage
          : GenreImage // ignore: cast_nullable_to_non_nullable
              as String,
      GenreId: null == GenreId
          ? _value.GenreId
          : GenreId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Genre with DiagnosticableTreeMixin implements _Genre {
  _$_Genre(
      {required this.GenreName,
      required this.GenreImage,
      required this.GenreId});

  factory _$_Genre.fromJson(Map<String, dynamic> json) =>
      _$$_GenreFromJson(json);

  @override
  final String GenreName;
  @override
  final String GenreImage;
  @override
  final String GenreId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Genre(GenreName: $GenreName, GenreImage: $GenreImage, GenreId: $GenreId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Genre'))
      ..add(DiagnosticsProperty('GenreName', GenreName))
      ..add(DiagnosticsProperty('GenreImage', GenreImage))
      ..add(DiagnosticsProperty('GenreId', GenreId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Genre &&
            (identical(other.GenreName, GenreName) ||
                other.GenreName == GenreName) &&
            (identical(other.GenreImage, GenreImage) ||
                other.GenreImage == GenreImage) &&
            (identical(other.GenreId, GenreId) || other.GenreId == GenreId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, GenreName, GenreImage, GenreId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreCopyWith<_$_Genre> get copyWith =>
      __$$_GenreCopyWithImpl<_$_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreToJson(
      this,
    );
  }
}

abstract class _Genre implements Genre {
  factory _Genre(
      {required final String GenreName,
      required final String GenreImage,
      required final String GenreId}) = _$_Genre;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$_Genre.fromJson;

  @override
  String get GenreName;
  @override
  String get GenreImage;
  @override
  String get GenreId;
  @override
  @JsonKey(ignore: true)
  _$$_GenreCopyWith<_$_Genre> get copyWith =>
      throw _privateConstructorUsedError;
}
