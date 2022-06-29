import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GrafikSeker.dart';
import 'GrafikTansiyon.dart';
import 'VideoOynat.dart';
import 'VideoOynat2.dart';


class TansiyonSeker extends StatefulWidget {
  const TansiyonSeker({Key? key}) : super(key: key);
  @override
  State<TansiyonSeker> createState() => _TansiyonSekerState();
}

class _TansiyonSekerState extends State<TansiyonSeker> {
  final controller_kalphizi = TextEditingController();
  String sorgulakalphizi = "";
  String bilgivertansiyon = "";
  String bilgiverkalp = "";
  String bilgiverseker = "";

  void SorgulaKalpHizi() {
    double veri = double.parse(controller_kalphizi.text);
    if (veri > 60 && veri < 100) {
      setState(() {
        sorgulakalphizi = "Kalp hızınız normal.";
      });
    }
    if (veri < 60) {
      setState(() {
        sorgulakalphizi = "Kalp hızınız düşük!";
        bilgiverkalp = "Dikkat! Kalp hızınız yavaş! Baş dönmesi, baygınlık, terleme, sinir sistemi bozukluklar gelişebilir. Beyin kanaması,"
            "Spor yapmaya özen gösteriniz. Mutlaka doktora görününüz! ";
      });
    }
    if (veri > 100) {
      setState(() {
        sorgulakalphizi = "Kalp hızınız yüksek!";
        bilgiverkalp = "Dikkat! Kalp hızınız yüksek! Kalp yetmezliği, tifo, tiroit, guatr gibi pek çok hastalığın sonucu olarak "
            "nabız hızlanabilir. Mutlaka doktora görününüz! ";
      });
    }
  }

  final controller_ktansiyon = TextEditingController();
  final controller_btansiyon = TextEditingController();
  String sorgulatansiyon = "";
  String sorgulatansiyon2 = "";

  void SorgulaTansiyon() {
    double veri = double.parse(controller_btansiyon.text);
    double veri2 = double.parse(controller_ktansiyon.text);
    if (veri != null && veri2 != null) {
      if(veri<70 || veri>190 || veri2<40 || veri2>120) {
        setState(() {
          sorgulatansiyon = "Girilen değerler aralıkta değil!";
          sorgulatansiyon2 = "Girilen değerler aralıkta değil!";
        });
      }
      if (veri > 69 && veri < 90) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon düşük!";
        });
      }
      if (veri > 91 && veri < 120) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon normal.";
        });
      }
      if (veri > 121 && veri < 130) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon yükselmiş!";
        });
      }
      if (veri > 129 && veri < 140) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon yüksek(Hipertansiyon 1.seviye)!";
        });
      }
      if (veri > 139 && veri < 180) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon yüksek(Hipertansiyon 2.seviye)!";
        });
      }
      if (veri > 179 && veri < 191) {
        setState(() {
          sorgulatansiyon = "Büyük tansiyon çok yüksek(Hipertansiyon krizi)!";
        });
      }
      if (veri2 > 39 && veri2 < 60) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon düşük!";
        });
      }
      if (veri2 > 59 && veri2 < 80) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon normal.";
        });
      }
      if (veri2 > 79 && veri2 < 90) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon yükselmiş!";
        });
      }
      if (veri2 > 89 && veri2 < 100) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon yüksek(Hipertansiyon 1.seviye)!";
        });
      }
      if (veri2 > 99 && veri2 < 110) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon yüksek(Hipertansiyon 2.seviye)!";
        });
      }
      if (veri2 > 109 && veri2 < 121) {
        setState(() {
          sorgulatansiyon2 = "Küçük tansiyon çok yüksek(Hipertansiyon krizi)!";
        });
      }
      if (veri > 69 && veri < 90 || veri2 > 39 && veri2 < 60) {
        setState(() {
          bilgivertansiyon = "DİKKAT! Tansiyonunuz düşmüş!Ani hareketle veya ayağa kalkınca baş "
              "dönmesi, halsizlik, baygınlığa ve görme kaybına neden olabilir.Otonom sinir sistemi disfonksiyonu, Kan düşüklüğü(anemi)"
              " veya Amiloidoz ile beraber olabilir.Mutlaka hekime başvurunuz!";
        });
      }
      if (veri > 129 && veri < 140 || veri2 > 89 && veri2 < 100 ||
          veri > 139 && veri < 180 || veri2 > 99 && veri2 < 110 ||
          veri > 121 && veri < 130 || veri2 > 79 && veri2 < 90) {
        setState(() {
          bilgivertansiyon = "DİKKAT! Tansiyonunuz çok yüksek!Hipertansiyon tehlikelidir.Baş ağrısı,"
              " burun kanaması, kulaklarda çınlama, halsizlik, sık idrara çıkma ve bacaklarda şişlik şeklinde "
              "belirtiler verebilir.Mutlaka hekime başvurunuz!";
        });
      }
      if (veri > 179 && veri < 191 || veri2 > 109 && veri2 < 121) {
        setState(() {
          bilgivertansiyon = "DİKKAT! Hipertansiyon krizi geçirmektesiniz.Bulantı, kusma, görme bozukluğu ve birden başlayan "
              "yaygın-ciddi ağrılar olabilir.Acilen hekime başvurunuz!";
        });
      }
    }
  }

  final controller_sekertokluk = TextEditingController();
  final controller_sekeraclik = TextEditingController();
  String sorgulasekertokluk = "";
  String sorgulasekeraclik = "";

  void SorgulaSeker() {
    double veri = double.parse(controller_sekertokluk.text);
    double veri2 = double.parse(controller_sekeraclik.text);

    if (veri != null && veri2 != null) {
      if(veri<100 || veri>300 || veri2<50 || veri2>200){
        setState(() {
          sorgulasekertokluk = "Girilen değerler aralıkta değil!";
          sorgulasekeraclik = "Girilen değerler aralıkta değil!";
        });
      }
      if (veri > 99 && veri < 140) {
        setState(() {
          sorgulasekertokluk = "Tokluk kan şekeri normal.";
        });
      }
      if (veri > 139 && veri < 200) {
        setState(() {
          sorgulasekertokluk = "Tokluk kan şekeri yükselmiş(Gizli şeker) !";
        });
      }
      if (veri > 199 && veri < 301) {
        setState(() {
          sorgulasekertokluk = "Tokluk kan şekeri çok yüksek(Diyabet)!";
        });
      }
      if (veri2 > 49 && veri2 < 70) {
        setState(() {
          sorgulasekeraclik = "Açlık kan şekeri düşük(Hipoglisemi) !";
          bilgiverseker = "Dikkat! Kan Şekeri Düşük!Çok şeker içeren yiyecekler, içecekler veya ilaçlarla değerlerinizi"
              " hızla normale döndürebilirsiniz.Yemek yemeden yoğun şekilde alkol tüketmek, şiddetli hepatit veya siroz gibi"
              " ileri karaciğer hastalıkları, böbrek üstü bezi veya hipofiz tümörü bozuklukları hipoglisemiye neden olabilir."
              "Mutlaka doktora başvurunuz.";
        });
      }
      if (veri2 > 69 && veri2 < 100) {
        setState(() {
          sorgulasekeraclik = "Açlık kan şekeri normal .";
        });
      }
      if (veri2 > 99 && veri2 < 126) {
        setState(() {
          sorgulasekeraclik = "Açlık kan şekeri yükselmiş(Gizli şeker)!";
        });
      }
      if (veri2 > 125 && veri2 < 201) {
        setState(() {
          sorgulasekeraclik = "Açlık kan şekeri çok yüksek(Diyabet)!";
        });
      }

      if (veri2 > 99 && veri2 < 126 || veri > 139 && veri < 200) {
        setState(() {
          bilgiverseker = "Dikkat! Kan Şekeri Yükselmiş!Organ hasarı, görmede bozukluk, kalp krizi riski gibi sorunlar"
              " oluşabilir.Mutlaka doktora başvurunuz.";
        });
      }
      if (veri2 > 125 && veri2 < 201 || veri > 199 && veri < 301) {
        setState(() {
          bilgiverseker = "Dikkat! Kan Şekeri Çok Yüksek!Normalde görülen aşırı susama, sık idrara çıkma ve yorgunluk gibi "
              "semptomların yanı sıra kalp ve sinirlerle ilgili ciddi sorunların ortaya çıkması ihtimalini arttırır."
              "Mutlaka doktora başvurunuz.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN',
          style: GoogleFonts.rubikBeastly(
              fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 70, width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(100.0),
                  bottomLeft: Radius.circular(10.0),),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.blue.shade300]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    child: new Image(
                      width: 120.0,
                      height: 140.0,
                      image: new AssetImage(
                          'Assets_Varlıklar/resimler/kalp.jpg'),
                    ),
                  ),
                  Text('Tansiyon Şeker Analizi', style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      shadows: [Shadow(color: Colors.white70,
                          offset: Offset(1, 2),
                          blurRadius: 4)
                      ]
                  )),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.limeAccent,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4)
                      ]),
                  child: TextFormField(
                    controller: controller_kalphizi,
                    validator: (value) {
                      if (value!.isEmpty) return "Kalp hızı gir";
                    },
                    decoration: InputDecoration(
                        hintText: "Kalp hızı",
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.blue)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                VerticalDivider(),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  tooltip: "Onay",
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  onPressed: SorgulaKalpHizi,
                ),
                VerticalDivider(),
                Container(
                  height: 40.0, width: 140,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade300, Colors.white]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      sorgulakalphizi,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 175,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.limeAccent,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4)
                      ]),
                  child: TextFormField(
                    controller: controller_btansiyon,
                    validator: (value) {
                      if (value!.isEmpty) return "Büyük tansiyon gir";
                    },
                    decoration: InputDecoration(
                        hintText: "Büyük tansiyon",
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.blue)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 175,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.limeAccent,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4)
                      ]),
                  child: TextFormField(
                    controller: controller_ktansiyon,
                    validator: (value) {
                      if (value!.isEmpty) return "Küçük tansiyon gir";
                    },
                    decoration: InputDecoration(
                        hintText: "Küçük tansiyon",
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.blue)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  tooltip: "Onay",
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  onPressed: SorgulaTansiyon,
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Container(
              height: 40.0, width:400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade300, Colors.white]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  sorgulatansiyon+'  /  '+sorgulatansiyon2,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),


            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 175,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.limeAccent,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4)
                      ]),
                  child: TextFormField(
                    controller: controller_sekertokluk,
                    validator: (value) {
                      if (value!.isEmpty) return "Tokluk şekeri gir";
                    },
                    decoration: InputDecoration(
                        hintText: "Tokluk şeker",
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.blue)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 175,
                  height: 40,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.limeAccent,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 4)
                      ]),
                  child: TextFormField(
                    controller: controller_sekeraclik,
                    validator: (value) {
                      if (value!.isEmpty) return "Açlık şeker gir";
                    },
                    decoration: InputDecoration(
                        hintText: "Açlık şeker",
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.blue)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  tooltip: "Onay",
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  onPressed: SorgulaSeker,
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Container(
              height: 40.0, width:400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade300, Colors.white]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  sorgulasekertokluk+'  /  '+sorgulasekeraclik,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.file_download),
                  tooltip: "Tansiyon Nasıl Ölçülür İzlemek İster Misin?",
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Videoynat(),),
                    );
                  },
                ),
                VerticalDivider(),
                FloatingActionButton(
                  child: Icon(Icons.arrow_circle_down),
                  tooltip: "Tansiyon Değer Aralığı Grafikleri",
                  backgroundColor: Colors.limeAccent,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Grafik1(),),
                    );
                  },
                ),
                VerticalDivider(),
                FloatingActionButton(
                  child: Icon(Icons.arrow_circle_down),
                  tooltip: "Kan Şekeri Değer Aralığı Grafikleri",
                  backgroundColor: Colors.limeAccent,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Grafik2(),),
                    );
                  },
                ),
                VerticalDivider(),
                FloatingActionButton(
                  child: Icon(Icons.file_download),
                  tooltip: "Kan Şekeri Nasıl Ölçülür İzlemek İster Misin?",
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Videoynat2(),),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 20.0),
            Container(
              height: 180.0, width: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.indigo]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),

              child:Center( child: Column(children: <Widget>[
                  Text(
                    bilgiverkalp,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                      bilgivertansiyon,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                SizedBox(height: 10.0),
                Text(
                  bilgiverseker,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                ],
              ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
