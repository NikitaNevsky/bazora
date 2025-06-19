class CategoryResponse {
  String? categoryId;
  String? name;
  String? image;

  CategoryResponse({this.categoryId, this.name, this.image});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
