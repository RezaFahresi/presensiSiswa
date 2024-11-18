class Siswa {
  final String name;
  bool hadir;

  Siswa({required this.name, this.hadir = false});
}

class RiwayatKehadiran {
  DateTime tanggal;
  int jumlahHadir;
  int jumlahTidakHadir;

  RiwayatKehadiran({required this.tanggal, required this.jumlahHadir, required this.jumlahTidakHadir});
}