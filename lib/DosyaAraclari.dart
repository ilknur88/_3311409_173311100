import "package:path_provider/path_provider.dart";
import 'dart:io';
import 'dart:async';

class DosyaAraclar {

  static Future<String> get getDosyayolu async {
    final dizin = await getApplicationDocumentsDirectory();
    return dizin.path;
  }

  static Future<File> get getDosya async {
    final dosyayolu = await getDosyayolu;
    return File('$dosyayolu/dosya.txt');
  }

  static Future<File> saveDosya(String data) async {
    final dosyam = await getDosya;
    return dosyam.writeAsString(data);
  }

  static Future<String> readDosya() async {
    try {
      final dosyam = await getDosya;
      String dosyaicerik = await dosyam.readAsString();
      return dosyaicerik;
    } catch (e) {
      return "";
    }
  }

}


