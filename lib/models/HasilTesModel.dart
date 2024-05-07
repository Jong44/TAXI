class HasilModelModel {
  final kategori;
  final maxPoint;
  final minPoint;
  final potensi;
  final saran;

  HasilModelModel(
      {this.kategori, this.maxPoint, this.minPoint, this.potensi, this.saran});

  factory HasilModelModel.fromJson(Map<String, dynamic> json) {
    return HasilModelModel(
      kategori: json['kategori'],
      maxPoint: json['maxPoint'],
      minPoint: json['minPoint'],
      potensi: json['potensi'],
      saran: json['saran'],
    );
  }
}
