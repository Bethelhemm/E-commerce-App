// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$productImpl _$$productImplFromJson(Map<String, dynamic> json) =>
    _$productImpl(
      productName: json['productName'] as String,
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
      prodectDescription: json['prodectDescription'] as String?,
      productPrice: (json['productPrice'] as num).toDouble(),
      productSalePrice: (json['productSalePrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      productSKU: json['productSKU'] as String?,
      productType: json['productType'] as String?,
      productStatus: json['productStatus'] as String?,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$productImplToJson(_$productImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'genre': instance.genre,
      'prodectDescription': instance.prodectDescription,
      'productPrice': instance.productPrice,
      'productSalePrice': instance.productSalePrice,
      'productImage': instance.productImage,
      'productSKU': instance.productSKU,
      'productType': instance.productType,
      'productStatus': instance.productStatus,
      'productId': instance.productId,
    };
