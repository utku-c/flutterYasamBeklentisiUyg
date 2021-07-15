import 'package:flutter/material.dart';
//import 'package:flutter_uyg2/Contants.dart';
import 'package:flutter_uyg2/UserData.dart';
import 'Hesap.dart';

class ResualtPage extends StatelessWidget {
  final UserData userData;

  ResualtPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuc Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(userData).hesaplama().round().toString(),
              style: TextStyle(
                  color: Colors.blueAccent.shade400,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'GERİ DÖN',
                style: TextStyle(
                    color: Colors.blueAccent.shade700,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
