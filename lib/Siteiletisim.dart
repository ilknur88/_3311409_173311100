import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class IletisimBilg extends StatelessWidget {
  const IletisimBilg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

      body: ListView(
        children: <Widget>[
       Column(
      children: <Widget>[
        Container(
        height: 600.0, width: 600.0,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20.0),
        ),
        child:  Column( children: <Widget>[
        SizedBox(height: 30.0),
           Text('Adres',
            style: GoogleFonts.ultra(fontSize: 25.0, color: Colors.black),),
          SizedBox(height: 25.0),
        Container(
          height: 60.0, width: 800.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green,
          ),
          child:  Center(
            child:  Text('Bahçelievler Mah. 89. Cad. 8/A ÇANKAYA / ANKARA',
              style: GoogleFonts.ultra(fontSize: 18.0, color: Colors.black),),
          ),
        ),

        SizedBox(height: 30.0),
        Text('Telefon',
          style: GoogleFonts.ultra(fontSize: 25.0, color: Colors.black),),
        SizedBox(height: 25.0),
        Container(
          height: 60.0, width: 800.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green,
          ),
          child:  Center(
            child:  Text('0312 879 25 48',
              style: GoogleFonts.ultra(fontSize: 15.0, color: Colors.black),),
          ),
        ),

        SizedBox(height: 30.0),
        Text('E-mail',
          style: GoogleFonts.ultra(fontSize: 25.0, color: Colors.black),),
        SizedBox(height: 25.0),
        Container(
          height: 60.0, width: 800.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green,
          ),
          child:  Center(
            child:  Text('info@saglikliyasamsaglikliinsan.com.tr',
              style: GoogleFonts.ultra(fontSize: 18.0, color: Colors.black),
            ),
          ),
        ),
          ],
        ),
        ),
      ],
        ),
    ],
      ),
    );
  }
}
