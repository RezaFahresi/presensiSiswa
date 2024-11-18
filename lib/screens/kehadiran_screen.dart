import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/kehadiran_provider.dart';

class KehadiranScreen extends StatefulWidget {
  @override
  _KehadiranScreenState createState() => _KehadiranScreenState();
}

class _KehadiranScreenState extends State<KehadiranScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);
    final siswa = provider.daftarSiswa;

    // Untuk tanggal
    String formattedDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
        backgroundColor: Colors.blueAccent,
        elevation: 3.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white10, Colors.white10],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Typo diperbaiki
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                formattedDate, // Tanggal hari ini
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: siswa.length,
                  itemBuilder: (context, index) {
                    final siswaItem = siswa[index]; // Variabel diubah untuk menghindari konflik nama
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        title: Text(
                          siswaItem.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Checkbox(
                          value: siswaItem.hadir,
                          onChanged: (value) {
                            setState(() {
                              siswaItem.hadir = value ?? false;
                            });
                            provider.notifyListeners(); // Typo diperbaiki
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: siswa.any((s) => s.hadir)
                      ? () {
                    provider.simpanKehadiran();
                  }
                      : null,
                  child: Text('Simpan Kehadiran'), // Typo diperbaiki
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
