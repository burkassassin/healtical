import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

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
            /*
            Container(
              height: 200,
              width: 200,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                      "assets/happy.svg",
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      "assets/sad.svg",
                      fit: BoxFit.contain,
                    ),
            ),*/
            SizedBox(
              height: 8,
            ),
            Text(
              "Your BMI is ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            bmiModel.isNormal
                ? Text(
                    "Hallelujah! Your BMI is Normal.",
                    style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                : Text(
                    "Oops! Your BMI is not Normal.",
                    style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 18,
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
