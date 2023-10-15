// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get productName => throw _privateConstructorUsedError;
  Genre get genre => throw _privateConstructorUsedError;
  String? get prodectDescription => throw _privateConstructorUsedError;
  double get productPrice => throw _privateConstructorUsedError;
  double get productSalePrice => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  String? get productSKU => throw _privateConstructorUsedError;
  String? get productType => throw _privateConstructorUsedError;
  String? get productStatus => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String productName,
      Genre genre,
      String? prodectDescription,
      double productPrice,
      double productSalePrice,
      String productImage,
      String? productSKU,
      String? productType,
      String? productStatus,
      String productId});

  $GenreCopyWith<$Res> get genre;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? genre = null,
    Object? prodectDescription = freezed,
    Object? productPrice = null,
    Object? productSalePrice = null,
    Object? productImage = null,
    Object? productSKU = freezed,
    Object? productType = freezed,
    Object? productStatus = freezed,
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      prodectDescription: freezed == prodectDescription
          ? _value.prodectDescription
          : prodectDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productSalePrice: null == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productSKU: freezed == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as String?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenreCopyWith<$Res> get genre {
    return $GenreCopyWith<$Res>(_value.genre, (value) {
      return _then(_value.copyWith(genre: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$productImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$productImplCopyWith(
          _$productImpl value, $Res Function(_$productImpl) then) =
      __$$productImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      Genre genre,
      String? prodectDescription,
      double productPrice,
      double productSalePrice,
      String productImage,
      String? productSKU,
      String? productType,
      String? productStatus,
      String productId});

  @override
  $GenreCopyWith<$Res> get genre;
}

/// @nodoc
class __$$productImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$productImpl>
    implements _$$productImplCopyWith<$Res> {
  __$$productImplCopyWithImpl(
      _$productImpl _value, $Res Function(_$productImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? genre = null,
    Object? prodectDescription = freezed,
    Object? productPrice = null,
    Object? productSalePrice = null,
    Object? productImage = null,
    Object? productSKU = freezed,
    Object? productType = freezed,
    Object? productStatus = freezed,
    Object? productId = null,
  }) {
    return _then(_$productImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      prodectDescription: freezed == prodectDescription
          ? _value.prodectDescription
          : prodectDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productSalePrice: null == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productSKU: freezed == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as String?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      productStatus: freezed == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$productImpl implements _product {
  _$productImpl(
      {required this.productName,
      required this.genre,
      required this.prodectDescription,
      required this.productPrice,
      required this.productSalePrice,
      required this.productImage,
      required this.productSKU,
      required this.productType,
      required this.productStatus,
      required this.productId});

  factory _$productImpl.fromJson(Map<String, dynamic> json) =>
      _$$productImplFromJson(json);

  @override
  final String productName;
  @override
  final Genre genre;
  @override
  final String? prodectDescription;
  @override
  final double productPrice;
  @override
  final double productSalePrice;
  @override
  final String productImage;
  @override
  final String? productSKU;
  @override
  final String? productType;
  @override
  final String? productStatus;
  @override
  final String productId;

  @override
  String toString() {
    return 'Product(productName: $productName, genre: $genre, prodectDescription: $prodectDescription, productPrice: $productPrice, productSalePrice: $productSalePrice, productImage: $productImage, productSKU: $productSKU, productType: $productType, productStatus: $productStatus, productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$productImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.prodectDescription, prodectDescription) ||
                other.prodectDescription == prodectDescription) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productSalePrice, productSalePrice) ||
                other.productSalePrice == productSalePrice) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.productSKU, productSKU) ||
                other.productSKU == productSKU) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productName,
      genre,
      prodectDescription,
      productPrice,
      productSalePrice,
      productImage,
      productSKU,
      productType,
      productStatus,
      productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$productImplCopyWith<_$productImpl> get copyWith =>
      __$$productImplCopyWithImpl<_$productImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$productImplToJson(
      this,
    );
  }
}

abstract class _product implements Product {
  factory _product(
      {required final String productName,
      required final Genre genre,
      required final String? prodectDescription,
      required final double productPrice,
      required final double productSalePrice,
      required final String productImage,
      required final String? productSKU,
      required final String? productType,
      required final String? productStatus,
      required final String productId}) = _$productImpl;

  factory _product.fromJson(Map<String, dynamic> json) = _$productImpl.fromJson;

  @override
  String get productName;
  @override
  Genre get genre;
  @override
  String? get prodectDescription;
  @override
  double get productPrice;
  @override
  double get productSalePrice;
  @override
  String get productImage;
  @override
  String? get productSKU;
  @override
  String? get productType;
  @override
  String? get productStatus;
  @override
  String get productId;
  @override
  @JsonKey(ignore: true)
  _$$productImplCopyWith<_$productImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
