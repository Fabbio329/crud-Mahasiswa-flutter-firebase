import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_mahasiswa/model/mahasiswa_model.dart';

class FirestoreService {
  final CollectionReference mahasiswaCollection =
      FirebaseFirestore.instance.collection('mahasiswa');

  //fungsi menambahkan data mahasiswa (create)
  Future<void> addMahasiswa(Mahasiswa mhs){
    return mahasiswaCollection.add(mhs.toMap());
  }

  //fungsi mengambil data mahasiswa (read)
  Stream<List<Mahasiswa>> getMahasiswa(){
    return mahasiswaCollection.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return Mahasiswa.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  //fungsi update data mahasiswa (update)
  Future<void> updateMahasiswa(Mahasiswa mhs){
    return mahasiswaCollection.doc(mhs.id).update(mhs.toMap());
  }

  //fungsi menghapus data mahasiswa (delete)
  Future<void> deleteMahasiswa(String id) {
    return mahasiswaCollection.doc(id).delete();
  }
}