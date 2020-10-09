import 'package:bmi_app/calculators/basal.dart';
import 'package:bmi_app/calculators/ideal_weight.dart';
import 'package:bmi_app/calculators/open_calculator(bmi).dart';
import 'package:flutter/material.dart';

class UserChoice extends StatefulWidget {
  @override
  _UserChoiceState createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "- Let's choose your \n",
                      style: TextStyle(color: Colors.black, fontSize: 42)),
                  TextSpan(
                      text: "calculator !",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 42,
                          fontWeight: FontWeight.bold))
                ]),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              elevation: 8,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
              child: Text("BMI Calculator", style: TextStyle(
                fontSize: 20
              ),),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BMICalculation()));
              },
            ),
            SizedBox(height: 30),
            RaisedButton(
              elevation: 8,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
              child: Text("İdeal Weight Calculator",style: TextStyle(
                fontSize: 20
              ),),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => IdealCalculator()));
              },
            ),
            SizedBox(height: 30),
            RaisedButton(
              elevation: 8,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
              child: Text("Basal Metabolic Rate Calculator", style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BasalCalculator()));
              },
            )
          ],
        ),
      ),
    );
  }
}
