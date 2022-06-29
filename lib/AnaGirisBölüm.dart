import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'YemekSiparisS.dart';
import 'TansiyonSekerTakipS.dart';
import 'BedenKitleIndexHesapla.dart';
import 'GirisYap.dart';

class AnaGiris extends StatefulWidget {
  @override
  _AnaGirisState createState() => _AnaGirisState();
}

class _AnaGirisState extends State<AnaGiris> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text('SAĞLIKLI YAŞAM SAĞLIKLI İNSAN',
          style: GoogleFonts.rubikBeastly(fontSize: 17.0, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((kullanici){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GirisYap()),);
            });
          },
              icon: Icon(Icons.exit_to_app))
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
             child: GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(
                builder: (context) => TansiyonSeker(),),
              ); },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _controller,
                    child: const Center(
                      child:  Icon(
                        Icons.health_and_safety, color: Colors.green, size: 60.0,
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                  ),
                  Center( child: Container(
                    height: 50, width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [
                          BoxShadow( color: Color(0xFF0d0102), blurRadius: 40.0, offset: Offset(0.0, 5.0),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFFf33c81), Color(0xFF24e01a),
                          ],
                        )
                    ),
                    child: const Center(
                      child: Text('Tansiyon-Şeker Takip Sistemi',
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),


          SizedBox(height: 20.0),
          Center(
            child: GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(
                builder: (context) => IdealKiloHesap(),),
              ); },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _controller,
                    child: const Center(
                      child:  Icon(
                        Icons.nature_people, color: Colors.green, size: 60.0,
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                  ),
                  Center( child: Container(
                    height: 50, width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [
                          BoxShadow( color: Color(0xFF0d0102), blurRadius: 40.0, offset: Offset(0.0, 5.0),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFFf33c81), Color(0xFF24e01a),
                          ],
                        )
                    ),
                    child: const Center(
                      child: Text('Beden Kitle Analiz Sistemi',
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),


          SizedBox(height: 15.0),
          Center(
            child: GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(
                builder: (context) => YemekSiparis(),),
              ); },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _controller,
                    child: const Center(
                      child:  Icon(
                        Icons.restaurant, color: Colors.green, size: 60.0,
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                  ),
                  Center( child: Container(
                    height: 50, width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [
                          BoxShadow( color: Color(0xFF0d0102), blurRadius: 40.0, offset: Offset(0.0, 5.0),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFFf33c81), Color(0xFF24e01a),
                          ],
                        )
                    ),
                    child: const Center(
                      child: Text('Sağlıklı Yemek Sipariş Sistemi',
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white70),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

