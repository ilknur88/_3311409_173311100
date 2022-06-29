import "package:flutter/material.dart";
import '/models/Kullanici.dart';
import '/services/Dbprovider.dart';
import '/KulaniciGiris.dart';

DbUsers usersss = DbUsers();

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List<User> userList = [];

  void getData() async {
    await usersss.users().then((result) => {
      setState(() {
        userList = result;
      })
    });
    print(userList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userList.length.toString() + " Users list")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userList[index].name+' '+userList[index].surname),
                    onTap: () {
                      showAlert("User " + index.toString() + " clicked",
                          "User " + index.toString() + " clicked");
                    },
                    onLongPress: () async {
                      await usersss.deleteUser(userList[index].id).then((value) => {
                        showAlert("User " + index.toString() + " deleted",
                            "User " + index.toString() + " deleted")
                      });
                      getData();
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
