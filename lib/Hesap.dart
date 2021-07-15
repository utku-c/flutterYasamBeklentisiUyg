import 'package:flutter_uyg2/UserData.dart';

class Hesap {
  UserData userData;

  Hesap(this.userData);

  double hesaplama() {
    double sonuc;

    sonuc = 90 + userData.sporGunu - userData.icilenCigara;
    sonuc = sonuc + (userData.boy / userData.kilo);

    if (userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else
      return sonuc;
  }
}
