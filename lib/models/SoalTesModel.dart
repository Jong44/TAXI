class SoalTesModel {
  final id;
  final teks;

  SoalTesModel({this.id, this.teks});

  factory SoalTesModel.fromJson(Map<String, dynamic> json) {
    return SoalTesModel(
      id: json['id'],
      teks: json['teks'],
    );
  }
}
