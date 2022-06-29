import "package:flutter/material.dart";
import '/views/Listkullanici.dart';
import 'package:sqflite/sqflite.dart';
import '/models/Kullanici.dart';
import '/services/Dbprovider.dart';

DbUsers usersss = DbUsers();

class Kullanicigiris extends StatelessWidget {
  const Kullanicigiris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Kullanicigirisi(),
    );
  }
}

class Kullanicigirisi extends StatefulWidget {
  const Kullanicigirisi({Key? key}) : super(key: key);

  @override
  _KullanicigirisiState createState() => _KullanicigirisiState();
}

class _KullanicigirisiState extends State<Kullanicigirisi> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userSurnameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();

  late Future<Database> database;

  List<User> userList = [];

  _onPressedUpdate() async {
    final kullanici = User(
      id: int.parse(userIdController.text),
      name: userNameController.text,
      surname: userSurnameController.text,
      email: userEmailController.text,

    );
    usersss.updateUser(kullanici);
    userList = await usersss.users();
    //print(dogList);
    getData();
  }

  _onPressedAdd() async {
    final kullanici = User(
      id: int.parse(userIdController.text),
      name: userNameController.text,
      surname: userSurnameController.text,
      email: userEmailController.text,
    );
    usersss.insertUser(kullanici);
    userList = await usersss.users();
    getData();
  }

  _deleteDogTable() {
    usersss.deleteTable();
    userList = [];
    getData();
  }

  void getData() async {
    await usersss.users().then((result) => {
      setState(() {
        userList = result;
      })
    });
    print(userList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userIdController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'ID giriniz'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'İsim giriniz'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userSurnameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Soyisim giriniz'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email giriniz'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedAdd, child: Text("Ekle")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedUpdate, child: Text("Güncelle")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _deleteDogTable,
                    child: const Text("Sil")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListUsers()),
                      );
                    },
                    child: Text("Listele")),
              ),

              Text('Toplam: '+userList.length.toString()+' Kullanıcı'),


            ],
          ),
        ),
      ),
    );
  }
}
