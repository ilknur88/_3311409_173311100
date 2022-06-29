import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Siteiletisim.dart';
import 'UrunDetay.dart';
import 'Icecekler.dart';
import 'Yemekler.dart';
import 'Salatalar.dart';


class YemekSiparis extends StatefulWidget {
  const YemekSiparis({Key? key}) : super(key: key);

  @override
  State<YemekSiparis> createState() => _YemekSiparisState();
}

class _YemekSiparisState extends State<YemekSiparis> {

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
      drawer: Drawer(
        child: ListView(
          children:  [
            const DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Text('MENÜ'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: Text("İçecekler"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Icecekler()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.star,),
              title: const Text("Yemekler"),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Yemekler()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Salatalar"),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Salatalar()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 30.0),
          Padding(padding: const EdgeInsets.only(right: 450.0 ),
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.start,
              children: <Widget>[
                Text('Gurmelerimizin Seçimlerinden...', style: GoogleFonts.ultra(fontSize: 21.0, color: Colors.blueGrey),
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
                tasarlaListItem('Mantar Kavurma','Assets_Varlıklar/resimler/mantarkavurma.jpg',  '69.99 TL'),
                tasarlaListItem('Mücver','Assets_Varlıklar/resimler/mücver.jpg',  '50.59 TL'),
                tasarlaListItem('Bostan Salata','Assets_Varlıklar/resimler/bostanasalata.jpg',  '39.99 TL'),
                tasarlaListItem('Mercimekli Salata','Assets_Varlıklar/resimler/siyezlimercimeksalata.jpg',  '54.50 TL'),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 60.0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0),
            ),
            color:Colors.green
        ),
        padding: const EdgeInsets.only(left:40.0, right:40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: IconButton(
                icon: const Icon(Icons.home_outlined, size: 30.0),
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => YemekSiparis(),),
                  ); },
              ),),
            Container(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 30.0),
                color: Colors.white,
                onPressed: (){},
              ),),
            Container(
              child: IconButton(
                icon: const Icon(Icons.message_outlined, size: 30.0),
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const IletisimBilg(),),
                  ); },
              ),),
            Container(
              child: IconButton(
                icon: const Icon(Icons.account_circle_outlined, size: 30.0),
                color: Colors.white,
                onPressed: (){},
              ),),
          ],
        ),
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
