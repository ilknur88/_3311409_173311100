import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Grafik1 extends StatefulWidget {
  const Grafik1({Key? key}) : super(key: key);

  @override
  State<Grafik1> createState() => _Grafik1State();
}

class _Grafik1State extends State<Grafik1> {
  Map<String, double> dataMap = {
    "Düşük 70-90": 70,
    "Normal 90-120": 90,
    "Yükselmiş 120-129": 120,
    "Yüksek(Hipertansiyon 1.Seviye) 130-139": 130,
    "Yüksek(Hipertansiyon 2.Seviye) 140-180": 140,
    "Çok Yüksek(Hipertansiyon Krizi) 180-190": 180,
  };
  List<Color> colorList = [
    const Color(0xff0ecaff),
    const Color(0xff3EE094),
    const Color(0xfff5fd50),
    const Color(0xffFE9539),
    const Color(0xffFA4A42),
    const Color(0xffe31202),
  ];

  Map<String, double> dataMap2 = {
    "Düşük 40-60": 40,
    "Normal 60-80": 60,
    "Yükselmiş 80-90": 80,
    "Yüksek(Hipertansiyon 1.Seviye) 90-100": 90,
    "Yüksek(Hipertansiyon 2.Seviye) 100-110": 100,
    "Çok Yüksek(Hipertansiyon Krizi) 110-120": 110,
  };

  List<Color> colorList2 = [
    const Color(0xff0ecaff),
    const Color(0xff3EE094),
    const Color(0xfff5fd50),
    const Color(0xffFE9539),
    const Color(0xffFA4A42),
    const Color(0xffe31202),
  ];

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 340.0, width: 400.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.grey]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 2,
              centerText: "BüyükT.",
              ringStrokeWidth: 24,
              animationDuration: const Duration(seconds: 5),
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.bottom,
                    ),
        ),
      ),
            Container(
              height: 340.0, width: 400.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.grey]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: PieChart(
          dataMap: dataMap2,
          colorList: colorList2,
          chartRadius: MediaQuery.of(context).size.width / 2,
          centerText: "KüçükT.",
          ringStrokeWidth: 24,
          animationDuration: const Duration(seconds: 5),
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.bottom,
                ),
         ),
      ),

      ],
    ),
      ),
    );
  }
}