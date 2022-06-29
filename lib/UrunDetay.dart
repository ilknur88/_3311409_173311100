import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class UrunDetay extends StatefulWidget {

  final Isim; final Resim; final Fiyat;
  UrunDetay({this.Isim, this.Resim,  this.Fiyat});

  @override
  State<UrunDetay> createState() => _UrunDetayState();
}

class _UrunDetayState extends State<UrunDetay> {
  int urunSayisi = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
                  Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                        ),
               child: Positioned(
                 // top: -50.0,
                  left: (MediaQuery.of(context).size.width / 2) - 125,
                      child: Container(
                        // height: 300.0,
                        // width: 300.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.Resim),
                                fit: BoxFit.contain
                            )
                        ),
                      )
              ),
             ),
          SizedBox(height: 20.0),
             Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Text(widget.Isim,
                  style: GoogleFonts.ultra(fontSize: 20.0, color: Colors.black),),
                SizedBox(height: 25.0),
                Text( widget.Fiyat,
                    style: GoogleFonts.ultra(fontSize: 25.0,  color: Colors.black)),

                SizedBox(height: 25.0),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline, color: Colors.green),
                                onPressed: () { setState(() {
                                  urunSayisi -= 1;
                                });},
                              ),
                          Text('$urunSayisi',
                            style: GoogleFonts.ultra(fontSize: 25.0, color: Colors.black54),),
                              IconButton(
                                icon: Icon(Icons.add_circle, color: Colors.green),
                                onPressed: () { setState(() {
                                  urunSayisi += 1;
                                });},
                              )
                            ],
                          ),
                SizedBox(height: 25.0),
                Container(
                  height: 60.0, width: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF5AC035),
                  ),
                  child:  Center(
                    child:  Text('Ekle',
                       style: GoogleFonts.ultra(fontSize: 25.0, color: Colors.black),),

                  ),
                )
              ],
            ),
        ],
      ),
    ],
      ),
    );
  }
}
