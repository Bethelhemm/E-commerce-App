// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      GenreName: json['GenreName'] as String,
      GenreImage: json['GenreImage'] as String?,
      GenreId: json['GenreId'] as String,
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'GenreName': instance.GenreName,
      'GenreImage': instance.GenreImage,
      'GenreId': instance.GenreId,
    };
