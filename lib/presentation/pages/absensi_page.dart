import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbsensiPage extends StatefulWidget {
  @override
  _AbsensiPageState createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  String name = 'Edrick William Jensen'; // Nama karyawan
  
  DateTime? checkInTime;
  DateTime? checkOutTime;
  Duration? workDuration;

  // Fungsi format waktu
  String formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE, HH:mm, dd-MM-yyyy').format(dateTime);
  }

  // Fungsi untuk Check-in
  void checkIn() {
    setState(() {
      checkInTime = DateTime.now();
      checkOutTime = null; 
      workDuration = null;
    });
  }

  // Fungsi untuk Check-out
  void checkOut() {
    if (checkInTime != null) {
      setState(() {
        checkOutTime = DateTime.now();
        workDuration = checkOutTime!.difference(checkInTime!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi Karyawan Pt. Taman Walet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.png'), // Pastikan gambar ada di folder assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              children: [
                // Card for Employee Info
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  color: Colors.white.withOpacity(0.8), // Set transparency to make it blend
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama: $name",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        SizedBox(height: 20),
                        if (checkInTime != null) ...[
                          Text(
                            "Check-in: ${formatDateTime(checkInTime!)}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ] else ...[
                          Text("Belum Check-in.", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                        if (checkOutTime != null) ...[
                          Text(
                            "Check-out: ${formatDateTime(checkOutTime!)}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "Durasi Kerja: ${workDuration?.inHours} jam ${workDuration?.inMinutes.remainder(60)} menit",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ] else if (checkInTime != null) ...[
                          Text("Belum Check-out.", style: TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ],
                    ),
                  ),
                ),
                Spacer(),
                // Check-in and Check-out Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: checkIn,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        "Check-in",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: checkOut,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Text(
                        "Check-out",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
