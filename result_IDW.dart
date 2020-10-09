import 'package:flutter/material.dart';

class ResultofIdealWeight extends StatelessWidget {
  final iwm;
  ResultofIdealWeight({this.iwm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Your Ideal Weight is ${iwm.round()}",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
             SizedBox(
              height: 16,
            ),
            Container(
              child: FlatButton.icon(
                shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  label: Text("Do you wanna check again ?")),
            ),
          ],
        ),
      ),
    );
  }
}
