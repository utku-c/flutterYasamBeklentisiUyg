import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './IconCinsiyet.dart';
import './MyContainer.dart';
import './Contants.dart';
import 'ResualtPage.dart';
import 'UserData.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilenCigara = 15;
  double sporGunu = 3;
  int boy = 170;
  int kilo = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // satırın bütün ekranı kapsamasını sağlar
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                    renk: Colors.green.shade100,
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    renk: Colors.green.shade100,
                    onPress: () {},
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              renk: Colors.green.shade100,
              onPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Haftada Kaç Gün Spor Yapıyorsunuz ?',
                      style: kMetinStili),
                  Divider(
                    height: 10,
                    color: Colors.green.shade100,
                  ),
                  Text(sporGunu.round().toString(), style: kMetinSayilar),
                  Slider(
                    value: sporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                    min: 0,
                    max: 7,
                    divisions: 7,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde Kaç Sigara İçiyorsun ?', style: kMetinStili),
                  Divider(
                    height: 10,
                    color: Colors.green.shade100,
                  ),
                  Text(icilenCigara.round().toString(), style: kMetinSayilar),
                  Slider(
                    value: icilenCigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenCigara = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
              renk: Colors.green.shade100,
              onPress: () {},
            ),
          ),
          Expanded(
            // kadın erkek satırı
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.red.shade300
                        : Colors.green.shade100,
                    child: MyIconCinsiyet(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(
                        () {
                          seciliCinsiyet = 'ERKEK';
                        },
                      );
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.red.shade300
                        : Colors.green.shade100,
                    child: MyIconCinsiyet(
                      cinsiyet: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 80,
            buttonColor: Colors.amber,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 25),
                //primary: Colors.black,
                //onSurface: Colors.blue,
                //onPrimary: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResualtPage(
                      UserData(
                          kilo: kilo,
                          boy: boy,
                          seciliCinsiyet: seciliCinsiyet,
                          sporGunu: sporGunu,
                          icilenCigara: icilenCigara),
                    ),
                  ),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Column(
                  children: [
                    Text(
                      ' HESAPLA ',
                      // style: TextStyle(backgroundColor: Colors.amber.shade100),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label == 'BOY' ? boy.toString() : kilo.toString(),
              style: kMetinSayilar,
            )),
        SizedBox(
          width: 14,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade300,
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus, size: 24),
              ),
            ),
            Divider(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade300,
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesomeIcons.minus),
              ),
            )
          ],
        )
      ],
    );
  }
}
