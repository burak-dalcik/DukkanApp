import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int productId;
  final int subcategoryId;
  final String name;
  final String code;
  final String description;
  final double price;
  final String brand;
  final int stockCount; // Yeni alan
  final dynamic subcategory;

  Product({
    required this.productId,
    required this.subcategoryId,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.brand,
    required this.stockCount, // Yeni alanı ekliyoruz
    this.subcategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    int? productId,
    int? subcategoryId,
    String? name,
    String? code,
    String? description,
    double? price,
    String? brand,
    int? stockCount,
    dynamic subcategory,
  }) {
    return Product(
      productId: productId ?? this.productId,
      subcategoryId: subcategoryId ?? this.subcategoryId,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      stockCount: stockCount ?? this.stockCount,
      subcategory: subcategory ?? this.subcategory,
    );
  }
}
