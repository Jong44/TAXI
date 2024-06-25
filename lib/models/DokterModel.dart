class DokterModel {
  final String uid;
  final String fullname;
  final String spesialis;
  final List<String> category;
  final List<String> education;
  final int sipp;
  final String image_url;
  final int price;
  final int experience;

  DokterModel({
    required this.uid,
    required this.fullname,
    required this.spesialis,
    required this.category,
    required this.education,
    required this.sipp,
    required this.image_url,
    required this.price,
    required this.experience,
  });

  factory DokterModel.fromJson(Map<String, dynamic> json) {
    return DokterModel(
      uid: json['uid'],
      fullname: json['fullname'],
      spesialis: json['spesialis'],
      category: json['category'].cast<String>(),
      education: json['education'].cast<String>(),
      sipp: json['sipp'],
      image_url: json['image_url'],
      price: json['price'] as int,
      experience: json['experience'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullname': fullname,
      'spesialis': spesialis,
      'category': category,
      'education': education,
      'sipp': sipp,
      'image_url': image_url,
      'price': price,
      'experience': experience,
    };
  }
}
