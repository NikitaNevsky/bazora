class ProductWithImagesResponse {
  String? productId;
  String? name;
  List<Categories>? categories;
  String? description;
  int? price;
  num? retailPrice;
  List<Images>? images;

  ProductWithImagesResponse({
    this.productId,
    this.name,
    this.categories,
    this.description,
    this.price,
    this.images,
    this.retailPrice
  });

  ProductWithImagesResponse.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    description = json['description'];
    price = json['price'];
    retailPrice = json['retail_price'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['retail_price'] = retailPrice;
    data['price'] = price;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryId;
  String? name;

  Categories({this.categoryId, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    return data;
  }
}

class Images {
  String? imageId;
  String? productId;
  String? imageUrl;
  String? blurhash;
  bool? isPhoto;
  bool? isVideo;
  String? videoUrl;

  Images({
    this.imageId,
    this.productId,
    this.imageUrl,
    this.blurhash,
    this.isPhoto,
    this.isVideo,
    this.videoUrl,
  });

  Images.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    blurhash = json['blurhash'];
    isPhoto = json['is_photo'];
    isVideo = json['is_video'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_id'] = imageId;
    data['product_id'] = productId;
    data['image_url'] = imageUrl;
    data['blurhash'] = blurhash;
    data['is_photo'] = isPhoto;
    data['is_video'] = isVideo;
    data['video_url'] = videoUrl;
    return data;
  }
}
