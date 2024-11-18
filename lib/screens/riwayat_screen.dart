import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/kehadiran_provider.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);
    final riwayat = provider.riwayatKehadiran;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Colors.blueAccent,
        elevation: 3.0,
      ),
      body: riwayat.isEmpty
          ? Center(
        child: Text(
          'Belum ada riwayat kehadiran.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: riwayat.length,
        itemBuilder: (context, index) {
          final data = riwayat[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              title: Text(
                '${data.tanggal.day}/${data.tanggal.month}/${data.tanggal.year}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Hadir: ${data.jumlahHadir}, Tidak Hadir: ${data.jumlahTidakHadir}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
