import 'package:flutter/material.dart';
import './Contants.dart';

class MyIconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;

  MyIconCinsiyet({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        ),
      ],
    );
  }
}
