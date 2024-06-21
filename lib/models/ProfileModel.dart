class ProfileModel {
  String fullName;
  String birthday;
  String gender;
  String no_hp;
  String email;
  String image_url;

  ProfileModel({
    required this.fullName,
    required this.birthday,
    required this.email,
    required this.gender,
    required this.image_url,
    required this.no_hp,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['fullName'] ?? '',
      birthday: json['birthday'] ?? '',
      gender: json['gender'] ?? '',
      no_hp: json['no_hp'] ?? '',
      email: json['email'] ?? '',
      image_url: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'birthday': birthday,
      'gender': gender,
      'no_hp': no_hp,
      'email': email,
      'image_url': image_url,
    };
  }
}
