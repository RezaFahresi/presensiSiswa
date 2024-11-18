import 'package:flutter/material.dart';
import '../models/siswa.dart';

class KehadiranProvider with ChangeNotifier {
  final List<Siswa> _daftarSiswa = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
    Siswa(name: 'Reza'),
  ];

  List<Siswa> get daftarSiswa => _daftarSiswa;

  final List<RiwayatKehadiran> _riwayatKehadiran = [];
  List<RiwayatKehadiran> get riwayatKehadiran => _riwayatKehadiran.reversed.toList();

  void simpanKehadiran() {
    final jumlahHadir = _daftarSiswa.where((siswa) => siswa.hadir).length; // Properti 'hadir' dengan huruf kecil
    final jumlahTidakHadir = _daftarSiswa.length - jumlahHadir;

    _riwayatKehadiran.add(
      RiwayatKehadiran(
        tanggal: DateTime.now(),
        jumlahHadir: jumlahHadir,
        jumlahTidakHadir: jumlahTidakHadir,
      ),
    );

    for (var siswa in _daftarSiswa) {
      siswa.hadir = false; // Reset status hadir
    }

    notifyListeners(); // Memberitahukan perubahan data
  }
}
