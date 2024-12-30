class Subcategory {
  final int subcategoryId;
  final String name;

  Subcategory({
    required this.subcategoryId,
    required this.name,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      subcategoryId: json['subcategoryId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subcategoryId': subcategoryId,
      'name': name,
    };
  }
}
