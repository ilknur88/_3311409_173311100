import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GirisYap.dart';

class Uyeol extends StatefulWidget {
  const Uyeol({Key? key}) : super(key: key);

  @override
  State<Uyeol> createState() => _UyeolState();
}

class _UyeolState extends State<Uyeol> {
  String email= ''; String sifre = '';

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
            height: 600.0, width: 600.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),

            child: Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                child: Column(children: <Widget>[
                  SizedBox(height: 70.0),
                  const Text("Üye Olmak İster Misin?",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4 ) ]
                      )
                  ),
                  SizedBox(height: 30.0),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (girilenEmail) {
                      setState(() {
                        email = girilenEmail;
                      });
                    },
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0))),
                  ),

                  SizedBox(height: 10.0),
                  TextFormField(
                    onChanged: (girilenSifre) {
                      setState(() {
                        sifre = girilenSifre;
                      });
                    },
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),),
                        labelText: "Şifre",
                        labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0))),
                  ),
                  SizedBox(height: 10.0),

                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding:const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    children: <Widget>[
                      SizedBox(height: 28.0),
                      Container(
                        child:  FloatingActionButton(
                          child: Icon(Icons.add_task),
                          tooltip: "Onayla",
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          onPressed: () {
                            kayitol(); },
                        ),
                      ),
                    ],
                  ),
                ],

                )
            )
        ),
      ),
    );
  }
  void kayitol() {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: sifre).then((kullanici){
        Navigator.push(context, MaterialPageRoute(builder: (context) => GirisYap()),);
      });
   }

}
