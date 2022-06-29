import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class KaloriTakip extends StatefulWidget {
  const KaloriTakip({Key? key}) : super(key: key);

  @override
  State<KaloriTakip> createState() => _KaloriTakipState();
}

class _KaloriTakipState extends State<KaloriTakip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN', style: GoogleFonts.rubikBeastly(fontSize: 40.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),



    );
  }
}

