class UsersResponse {
  String? id;
  String? email;
  String? phone;
  String? photoUrl;
  String? name;
  String? surname;
  String? displayName;
  int? referralCode;

  UsersResponse(
      {this.id,
        this.email,
        this.phone,
        this.photoUrl,
        this.name,
        this.surname,
        this.displayName,
        this.referralCode});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    photoUrl = json['photo_url'];
    name = json['name'];
    surname = json['surname'];
    displayName = json['display_name'];
    referralCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo_url'] = this.photoUrl;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['display_name'] = this.displayName;
    data['referral_code'] = this.referralCode;
    return data;
  }
}
