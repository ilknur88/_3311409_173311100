import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'GirisYap.dart';
//import 'AnaGirisBölüm.dart';
//import 'KulaniciGiris.dart';
import 'GirisYap.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);
  @override
  Girisalan createState() => Girisalan();
}

class Girisalan extends State<Giris > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 19.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Container(
          color:Colors.red,
          height: 600.0, width: 410.0,

          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 200.0,
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 180.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 160.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 140.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 120.0,
                        backgroundImage: AssetImage("Assets_Varlıklar/resimler/Anasayfa.jpg"),


             child: Column(
               children: <Widget>[
                 SizedBox(height: 28.0),
                  Container(
                    child: FloatingActionButton(
                      child: Icon(Icons.add_reaction_outlined),
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => GirisYap(),),

                        ); },
                    ),
                  ),
               ],
             ),
            ),
          ),
        ),
      ),
    ),
  ),
  ),
),
);
}
}