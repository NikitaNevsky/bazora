class UsersResponse {
  String? id;
  String? email;
  String? phone;
  String? photoUrl;
  String? name;
  String? surname;
  String? displayName;
  String? referralCode;
  num? totalCashback;

  UsersResponse(
      {this.id,
        this.email,
        this.phone,
        this.photoUrl,
        this.name,
        this.surname,
        this.displayName,
        this.referralCode,
        this.totalCashback
      });

  UsersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    photoUrl = json['photo_url'];
    name = json['name'];
    surname = json['surname'];
    displayName = json['display_name'];
    referralCode = json['referral_code'];
    totalCashback = json['total_cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['photo_url'] = photoUrl;
    data['name'] = name;
    data['surname'] = surname;
    data['display_name'] = displayName;
    data['referral_code'] = referralCode;
    data['total_cashback'] = totalCashback;
    return data;
  }
}
