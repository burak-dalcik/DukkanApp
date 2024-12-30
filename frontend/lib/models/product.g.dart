// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: (json['productId'] as num).toInt(),
      subcategoryId: (json['subcategoryId'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      brand: json['brand'] as String,
      stockCount: (json['stockCount'] as num).toInt(),
      subcategory: json['subcategory'],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'subcategoryId': instance.subcategoryId,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'price': instance.price,
      'brand': instance.brand,
      'stockCount': instance.stockCount,
      'subcategory': instance.subcategory,
    };

