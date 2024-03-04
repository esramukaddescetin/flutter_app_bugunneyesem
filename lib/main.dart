import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BugunNeYesem());
}

class BugunNeYesem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text(
            'Bugün Ne Yesem?',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = [
    'Mercimek Çorbası',
    'Tarhana Çorbası',
    'Tavuksuyu Çorbası',
    'Düğün Çorbası',
    'Yoğurt Çorbası'
  ];

  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Balık'
  ];
  List<String> tatliAdlari = [
    'Kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  void RastgeleMenu() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                style: ButtonStyle(
                  //tıklandığında ve tıklanan süre boyunca yanan renk
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blueGrey),
                ),
                onPressed: RastgeleMenu,
                child: Image.asset('assets/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(
            corbaAdlari[corbaNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 300,
            child: Divider(height: 5, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueGrey),
                  ),
                  onPressed: RastgeleMenu,
                  child: Image.asset('assets/yemek_$yemekNo.jpg')),
            ),
          ),
          Text(yemekAdlari[yemekNo - 1], style: TextStyle(fontSize: 20)),
          Container(
            width: 300,
            child: Divider(height: 5, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueGrey),
                  ),
                  onPressed: RastgeleMenu,
                  child: Image.asset('assets/tatli_$tatliNo.jpg')),
            ),
          ),
          Text(tatliAdlari[tatliNo - 1], style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
