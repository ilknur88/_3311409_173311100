import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UrunDetay.dart';


class Salatalar extends StatefulWidget {
  const Salatalar({Key? key}) : super(key: key);

  @override
  State<Salatalar> createState() => _SalatalarState();
}

class _SalatalarState extends State<Salatalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN',
          style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Padding(padding: const EdgeInsets.only(right: 450.0 ),
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('SALATALAR...', style: GoogleFonts.ultra(fontSize: 21.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                tasarlaListItem('Avokadolu Salata','Assets_Varlıklar/resimler/avokadosalata.jpg',  '50.50 TL'),
                tasarlaListItem('Bostan Salata','Assets_Varlıklar/resimler/bostanasalata.jpg',  '39.99 TL'),
                tasarlaListItem('Bulgurlu Salata','Assets_Varlıklar/resimler/bulgursalata.jpg',  '40.59 TL'),
                tasarlaListItem('Mercimekli Salata','Assets_Varlıklar/resimler/siyezlimercimeksalata.jpg',  '54.50 TL'),
                tasarlaListItem('Roka Salata','Assets_Varlıklar/resimler/rokasalata.jpg',  '55.90 TL'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget tasarlaListItem(String urunisim,String urunresim, String fiyat) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => UrunDetay(Isim: urunisim, Resim: urunresim, Fiyat: fiyat)
          )));
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
                height: 300.0, width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(urunresim),
                              fit: BoxFit.contain
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)
                          )
                      ),
                    ),

                    Positioned(
                        top: 200.0, left: 10.0, right: 10.0,
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(urunisim,
                              style: GoogleFonts.ultra(fontSize: 15.0, color: Colors.black54),),
                            Text(fiyat,
                                style: GoogleFonts.ultra(fontSize: 15.0,  color: Colors.black54)),
                          ],
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}
