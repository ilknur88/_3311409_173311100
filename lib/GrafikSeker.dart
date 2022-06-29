import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Grafik2 extends StatefulWidget {
  const Grafik2({Key? key}) : super(key: key);

  @override
  State<Grafik2> createState() => _Grafik2State();
}

class _Grafik2State extends State<Grafik2> {
  Map<String, double> dataMap1 = {
    "Hipoglisemi 50-70": 50,
    "Normal 70-100": 70,
    "Gizli Şeker 100-125": 100,
    "Diyabet 126-200": 126,
  };
  List<Color> colorList1 = [
    const Color(0xffFE9539),
    const Color(0xff3EE094),
    const Color(0xffFA4A42),
    const Color(0xffe31202),
  ];

  Map<String, double> dataMap2 = {
    "Normal 100-140": 100,
    "Gizli Şeker 140-199": 140,
    "Diyabet 200-300": 200,
  };

  List<Color> colorList2 = [
    const Color(0xff3EE094),
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
                      colors: [Colors.blue.shade200, Colors.blue]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: PieChart(
                chartType: ChartType.ring,
                dataMap: dataMap1,
                colorList: colorList1,
                chartRadius: MediaQuery.of(context).size.width / 2,
                centerText: "AçlıkŞ.",
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
                  colors: [Colors.blue.shade200, Colors.blue]
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: PieChart(
            chartType: ChartType.ring,
            dataMap: dataMap2,
            colorList: colorList2,
            chartRadius: MediaQuery.of(context).size.width / 2,
            centerText: "ToklukŞ.",
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