import 'package:flutter/material.dart';
import 'presentation/pages/absensi_page.dart';  // Sesuaikan dengan jalur yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Karyawan WFH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi Karyawan Pt. Taman Walet'),
        backgroundColor: Colors.transparent, // Membuat appBar transparan
        elevation: 0, // Menghilangkan bayangan appBar
      ),
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.png'), // Path gambar di assets
                fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
              ),
            ),
          ),
          // Konten utama
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke AbsensiPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbsensiPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blueAccent, // Warna tombol
              ),
              child: Text(
                "Absen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
