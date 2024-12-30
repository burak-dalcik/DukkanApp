class ProductDetail {
  final int productDetailId;
  final String detail;

  ProductDetail({
    required this.productDetailId,
    required this.detail,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      productDetailId: json['productDetailId'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productDetailId': productDetailId,
      'detail': detail,
    };
  }

  static List<ProductDetail> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductDetail.fromJson(json)).toList();
  }
}
