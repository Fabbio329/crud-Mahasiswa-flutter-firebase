class Mahasiswa {
  String? id;
  String? nama;
  String? nim;
  String? kelas;

  Mahasiswa({
    required this.id, 
    required this.nama, 
    required this.nim, 
    required this.kelas,
  });

  //konversi data firestore ke objek mahasiswa
  factory Mahasiswa.fromMap(Map<String, dynamic> data, String id) {
    return Mahasiswa(
      id: id,
      nama: data['nama'],
      nim: data['nim'],
      kelas: data['kelas'],
    );
  }

  //konversi objek mahasiswa untuk disimpan ke firestore
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'kelas': kelas,
    };
  }
}