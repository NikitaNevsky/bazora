class CityResponse {
  String? id;
  String? nameRu;
  String? nameHy;
  int? country;

  CityResponse({this.id, this.nameRu, this.nameHy, this.country});

  CityResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRu = json['name_ru'];
    nameHy = json['name_hy'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ru'] = nameRu;
    data['name_hy'] = nameHy;
    data['country'] = country;
    return data;
  }
}
