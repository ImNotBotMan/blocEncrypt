import 'package:flutter/material.dart';

Future<void> popupWindow(encryptData, BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
                height: 350,
                width: 300,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Результат Зашифровки",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "$encryptData",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text("OK", style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )),
                ])));
      }).then((vallue) {
    print('closed ');
  });
}
