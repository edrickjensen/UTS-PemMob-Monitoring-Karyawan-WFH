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
        title: Text('Absensi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke AbsensiPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AbsensiPage()),
            );
          },
          child: Text("Absen"),
        ),
      ),
    );
  }
}
