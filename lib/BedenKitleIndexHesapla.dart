import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:decimal/decimal.dart';
import 'dart:math';
import 'DosyaAraclari.dart';


class IdealKiloHesap extends StatefulWidget {
  State<StatefulWidget> createState() => IdealKilo();
}

class IdealKilo extends State<IdealKiloHesap> {
  String dosyaicerik = "Kayıtlı Veri Yok";
  final controller_kilo = TextEditingController();
  final controller_boy = TextEditingController();
  final anahtar = GlobalKey<FormState>();
  final d = Decimal;

  String hesaplananindex = "";
  String idealhesaplamakilo = "";
  String kiloaralikbilgiver = "";
  String kiloaralikbilgiver2 = "";

//kadın ağırlığını hesaplamak için sınıf olusturalım
  void IdealIndexKadin() {
    int idealkilokdn = 21;
    int decimals = 2;
    num hsp = pow(10, decimals);

    //Herhangi bir alan boşsa doğrulamaları yapıyoruz
    if (anahtar.currentState!.validate()) {
      double kilo = double.parse(controller_kilo.text);
      double boy = double.parse(controller_boy.text);
      double bolboy = (boy) / 100;
      double carpboy = bolboy  * bolboy ;
      double sonuc = kilo / carpboy;

      double d = sonuc;
      d = (d * hsp).round() / hsp;

      // kişinin ağırlığını önermek için formül
      double tavsiye = (idealkilokdn * kilo) / d;
      tavsiye = (tavsiye * hsp).round() / hsp;

      setState(() {
        hesaplananindex = "Index: $d";
        idealhesaplamakilo = "İdeal Kilo: $tavsiye Kg";
      });

      if(d < 18.5){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Zayıf!";
          kiloaralikbilgiver2 = "Boyunuza göre uygun ağırlıkta olmadığınızı, zayıf olduğunuzu gösterir. Zayıflık, bazı hastalıklar için risk oluşturan "
              "ve istenmeyen bir durumdur. Boyunuza uygun ağırlığa erişmeniz için yeterli ve dengeli beslenmeli, beslenme alışkanlıklarınızı"
              " geliştirmeye özen göstermelisiniz.";
        });
      }
      if(d > 18.4 && d < 25){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Normal.";
          kiloaralikbilgiver2 = "Boyunuza göre uygun ağırlıkta olduğunuzu gösterir. Yeterli ve dengeli beslenerek ve düzenli fiziksel aktivite "
              "yaparak bu ağırlığınızı korumaya özen gösteriniz.";
        });
      }
      if(d > 24.9 && d < 30){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Kilolu!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu gösterir. Fazla kilolu olma durumu gerekli önlemler alınmadığı"
              " takdirde pek çok hastalık için risk faktörü olan obeziteye (şişmanlık) yol açar.";
        });
      }
      if(d > 29.9 && d < 40){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Şişman(Obez) 1.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir. "
              "Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna"
              " başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              "sağlık kuruluşuna başvurunuz.";
        });
      }
      if(d > 39.9 && d < 50){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Şişman(Morbid Obez) 2.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir."
              " Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna "
              "başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              " sağlık kuruluşuna başvurunuz.";
        });
      }
      if(d > 49.9){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Aşırı Şişman(Süper Obez) 3.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir."
              " Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna "
              "başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              " sağlık kuruluşuna başvurunuz.";
        });
      }

    }
  }

  // adam için formül
  void IdealIndexAdam() {
    int idealkiloadm = 24;
    int decimals = 2;
    num hsp = pow(10, decimals);

    //Herhangi bir alan boşsa doğrulamaları yapıyoruz
    if (anahtar.currentState!.validate()) {
      double kilo = double.parse(controller_kilo.text);
      double boy = double.parse(controller_boy.text);
      double bolboy = (boy) / 100;
      double carpboy = bolboy * bolboy;
      double sonuc = kilo / carpboy;

      double d = sonuc;
      d = (d * hsp).round() / hsp;

      //önerilen kilo
      double tavsiye = (idealkiloadm * kilo) / d;
      tavsiye = (tavsiye * hsp).round() / hsp;

      setState(() {
        hesaplananindex = "Index: $d";
        idealhesaplamakilo = "İdeal Kilo: $tavsiye Kg";
      });

      if(d < 18.5){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Zayıf!";
          kiloaralikbilgiver2 = "Boyunuza göre uygun ağırlıkta olmadığınızı, zayıf olduğunuzu gösterir. Zayıflık, bazı hastalıklar için risk oluşturan "
              "ve istenmeyen bir durumdur. Boyunuza uygun ağırlığa erişmeniz için yeterli ve dengeli beslenmeli, beslenme alışkanlıklarınızı"
              " geliştirmeye özen göstermelisiniz.";
        });
      }
      if(d > 18.4 && d < 25){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Normal.";
          kiloaralikbilgiver2 = "Boyunuza göre uygun ağırlıkta olduğunuzu gösterir. Yeterli ve dengeli beslenerek ve düzenli fiziksel aktivite "
              "yaparak bu ağırlığınızı korumaya özen gösteriniz.";
        });
      }
      if(d > 24.9 && d < 30){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Kilolu!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu gösterir. Fazla kilolu olma durumu gerekli önlemler alınmadığı"
              " takdirde pek çok hastalık için risk faktörü olan obeziteye (şişmanlık) yol açar.";
        });
      }
      if(d > 29.9 && d < 40){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Şişman(Obez) 1.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir. "
              "Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna"
              " başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              "sağlık kuruluşuna başvurunuz.";
        });
      }
      if(d > 39.9 && d < 50){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Şişman(Morbid Obez) 2.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir."
              " Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna "
              "başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              " sağlık kuruluşuna başvurunuz.";
        });
      }
      if(d > 49.9){
        setState(() {
          kiloaralikbilgiver = "Beden Kitle Endeksine Göre Aşırı Şişman(Süper Obez) 3.Sınıf!";
          kiloaralikbilgiver2 = "Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir."
              " Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna "
              "başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen,"
              " sağlık kuruluşuna başvurunuz.";
        });
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 17.0,
            color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),


      body: Form(key: anahtar,
         child: Center(
           child: Column(
            children: <Widget>[
              Container(
                height: 70, width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(100.0),
                    bottomRight: Radius.circular(10.0),),
                  gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[Colors.white, Colors.deepOrangeAccent.shade400]
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Beden Kitle Analizi', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        shadows:[Shadow(color:Colors.white70, offset:Offset(1,2), blurRadius: 4 ) ]
                    )),
                    Align(
                      child: new Image(
                        width: 120.0,
                        height: 140.0,
                        image: new AssetImage('Assets_Varlıklar/resimler/baskül.jpg'),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.0),

              SingleChildScrollView(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 170, height: 40,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Colors.blueGrey,
                          ),
                          child: TextFormField(
                            controller: controller_kilo,
                            validator: (value) {
                              if (value!.isEmpty) return "Agirlik gir";
                            },
                            decoration: InputDecoration(
                                hintText: "Kilo (kg)",
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.deepOrangeAccent)
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        VerticalDivider(),
                        Container(
                          width: 170, height: 40,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Colors.blueGrey,
                          ),
                          child: TextFormField(
                            controller: controller_boy,
                            validator: (value) {
                              if (value!.isEmpty) return "Boy gir";
                            },
                            decoration: InputDecoration(
                                hintText: "Boy (cm)",
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.deepOrangeAccent)
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 110, width: 110,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: new Image(
                                  image: new AssetImage('Assets_Varlıklar/resimler/kilo1.png'),
                                ),
                              )
                            ],
                          ),
                        ),
                    Column(
                      children: <Widget>[
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          child: Icon(Icons.woman),
                          tooltip: "Bayan",
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrangeAccent,
                          onPressed: IdealIndexKadin,
                        ),
                        VerticalDivider(),
                        FloatingActionButton(
                          child: Icon(Icons.man),
                          tooltip: "Bay",
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrangeAccent,
                          onPressed: IdealIndexAdam,
                        ),
                      ],
                    ),
                        FloatingActionButton(
                          child: Icon(Icons.save),
                          tooltip: "Bilgilerini Kaydetmek İster Misin?",
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pinkAccent.shade100,
                          onPressed: () {
                            DosyaAraclar.saveDosya('Kilo:'+controller_kilo.text+'        Boy:'+controller_boy.text);
                            //DosyaAraclar.saveDosya(controller_kilo.text);

                          },
                        ),
                      ],
                    ),
                        Container(
                          height: 160, width: 150,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: new Image(
                                  image: new AssetImage('Assets_Varlıklar/resimler/kilo2.png'),
                                ),
                              )
                            ],
                          ),
                        ),
                  ],
                ),

                    SizedBox(height: 5.0),
                    Container(
                      height: 40.0, width: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.deepOrangeAccent, Colors.blueGrey.shade100]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          hesaplananindex,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: 50.0, width: 400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blueGrey.shade100, Colors.deepOrangeAccent]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          idealhesaplamakilo,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 10.0),
                    Container(
                      height: 30.0, width: 400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.lightGreen,Colors.lightGreen.shade300,],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          kiloaralikbilgiver,
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100.0, width: 400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.lightGreen.shade400]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          kiloaralikbilgiver2,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),

                   SizedBox(height: 10.0),
                    FloatingActionButton(
                      child: Icon(Icons.file_open),
                      tooltip: "Kaydedilen Bilgilerini Görmek İster Misin?",
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.pinkAccent.shade100,
                      onPressed: () {
                        DosyaAraclar.readDosya().then((icerik) {
                          setState(() {
                            dosyaicerik = icerik;
                          });
                        });
                      },
                    ),
                    Container(
                      height: 50.0, width:400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.pinkAccent.shade100, Colors.white]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          dosyaicerik,
                          style: TextStyle(fontSize: 13.0,),),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
