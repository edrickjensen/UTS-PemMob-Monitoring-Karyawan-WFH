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
        title: Text('Absensi Karyawan WFH'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama: $name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (checkInTime != null) ...[
              Text(
                "Check-in: ${formatDateTime(checkInTime!)}",
                style: TextStyle(fontSize: 16),
              ),
            ] else ...[
              Text("Belum Check-in.", style: TextStyle(fontSize: 16)),
            ],
            if (checkOutTime != null) ...[
              Text(
                "Check-out: ${formatDateTime(checkOutTime!)}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Durasi Kerja: ${workDuration?.inHours} jam ${workDuration?.inMinutes.remainder(60)} menit",
                style: TextStyle(fontSize: 16),
              ),
            ] else if (checkInTime != null) ...[
              Text("Belum Check-out.", style: TextStyle(fontSize: 16)),
            ],
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: checkIn,
                  child: Text("Check-in"),
                ),
                ElevatedButton(
                  onPressed: checkOut,
                  child: Text("Check-out"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
