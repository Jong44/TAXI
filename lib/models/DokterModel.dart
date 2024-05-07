class DokterModel {
  final String nama;
  final String ahli;
  final List<String> kategori;
  final List<String> pendidikan;
  final int sipp;
  final String fotoProfil;
  final int harga;
  final int pengalaman;

  DokterModel({
    required this.nama,
    required this.ahli,
    required this.kategori,
    required this.pendidikan,
    required this.sipp,
    required this.fotoProfil,
    required this.harga,
    required this.pengalaman,
  });

  factory DokterModel.fromJson(Map<String, dynamic> json) {
    return DokterModel(
      nama: json['nama'],
      ahli: json['ahli'],
      kategori: List<String>.from(json['kategori']),
      pendidikan: List<String>.from(json['pendidikan']),
      sipp: json['sipp'],
      fotoProfil: json['fotoProfil'],
      harga: json['harga'] as int,
      pengalaman: json['pengalaman'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'ahli': ahli,
      'kategori': kategori,
      'pendidikan': pendidikan,
      'sipp': sipp,
      'fotoProfil': fotoProfil,
      'harga': harga,
      'pengalaman': pengalaman,
    };
  }
}
