class ProfileModel {
  String nama;
  String tanggalLahir;
  String jenisKelamin;
  String nomorTelepon;
  String alamatEmail;
  String fotoProfil;

  ProfileModel({
    required this.nama,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nomorTelepon,
    required this.alamatEmail,
    required this.fotoProfil,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'],
      tanggalLahir: json['tanggalLahir'],
      jenisKelamin: json['jenisKelamin'],
      nomorTelepon: json['nomorTelepon'],
      alamatEmail: json['alamatEmail'],
      fotoProfil: json['fotoProfil'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'nomorTelepon': nomorTelepon,
      'alamatEmail': alamatEmail,
      'fotoProfil': fotoProfil,
    };
  }
}
