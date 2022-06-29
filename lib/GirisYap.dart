import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AnaGirisBölüm.dart';
import 'SifreYenile.dart';
import 'UyeOl.dart';
import 'KulaniciGiris.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);
  @override
  Girisyap createState() => Girisyap();
}

class Girisyap extends State<GirisYap > {
  String email= ''; String sifre = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN',
          style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
                  SizedBox(height: 120.0),
                 const Text("Giriş Yapmak İster Misin?",
                     style: TextStyle(
                         color: Colors.black87,
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.normal,
                         shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4 ) ]
                     )
                ),

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
                      labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0), )),
                ),
                SizedBox(height: 30.0),

                TextFormField(
                  obscureText: true, //Şifre gizlendi
                  onChanged: (girilenSifre) {
                    setState(() {
                      sifre = girilenSifre;
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),),
                      labelText: "Şifre",
                      labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
                SizedBox(height: 30.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   SizedBox(height: 28.0),
                   Container(
                     child: FloatingActionButton(
                    child: Icon(Icons.add_task),
                    tooltip: "Giriş Yapmak İster Misin?",
                    backgroundColor: Colors.white,
                     foregroundColor: Colors.green,
                       onPressed: (){
                      girisyap();
                      },
                   ),
                   ),
                   VerticalDivider(),

                   Container(
                    child:  FloatingActionButton(
                      child: Icon(Icons.admin_panel_settings),
                      tooltip: "Şifreni Mi Unuttun?",
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.red,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Sifreyenile(),),
                        ); },
                     ),
                   ),
                   VerticalDivider(),
                   Container(
                     child: FloatingActionButton(
                       child: Icon(Icons.attribution),
                       tooltip: "Üye Olmak İster Misin?",
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.blue,
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => Uyeol(),),
                         ); },
                     ),
                   ),
                      VerticalDivider(),
                      Container(
                        child: FloatingActionButton(
                          child: Icon(Icons.arrow_forward),
                          tooltip: "Sqflite Üyelik",
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pinkAccent,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Kullanicigiris(),),
                            ); },
                        ),
                      ),


                  ],
                   ),
                 ],
               ),
           ),
      ),
      ),
    );
  }

  void girisyap() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: sifre).then((kullanici){
      Navigator.push(context, MaterialPageRoute(builder: (context) => AnaGiris()),);
    });
  }
}