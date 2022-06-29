import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Hata extends StatelessWidget {
  const Hata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Container(
          color:Colors.red,
          height: 600.0, width: 600.0,

          child: Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0, top: 100.0,),
            child: Column(children: <Widget>[
              Image.asset("Assets_Varlıklar/resimler/hata.png"),
                  SizedBox(height: 70.0),
              const Text("OOOPS!...",
                     style: TextStyle(
                         color: Colors.black87,
                         fontSize: 70,
                         fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.normal,
                         shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4 ) ]
                     )
                ),
              SizedBox(height: 10.0),
              const Text("SAYFA BULUNAMADI!...",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4  ) ]
                  )
              ),
            ],
          ),
            ),
        ),
      ),
    );
  }
}