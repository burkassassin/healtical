import 'package:bmi_app/models/bmi_model.dart';
import 'package:bmi_app/results/result_BMI.dart';

import 'package:flutter/material.dart';

class BMICalculation extends StatefulWidget {
  @override
  _BMICalculationState createState() => _BMICalculationState();
}

class _BMICalculationState extends State<BMICalculation> {
  double _userHeight = 100;
  double _userWeight = 40.0;
  double _bmi = 0;

  BMImodel _bmiModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * .1),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "- How about your \nBMI",
                            style: TextStyle(color: Colors.black, fontSize: 30)),
                        TextSpan(
                            text: " nowadays?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28),
              Center(
                child: Text(
                  "Height (cm)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 14, left: 14),
                child: Slider(
                  min: 80,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _userHeight = height;
                    });
                  },
                  value: _userHeight,
                  divisions: 680,
                  activeColor: Colors.black,
                  label: "$_userHeight",
                ),
              ),
              Center(
                child: Text(
                  "$_userHeight cm",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 22),
              Center(
                child: Text(
                  "Weight (kg)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 18, left: 18),
                child: Slider(
                  min: 30,
                  max: 170,
                  onChanged: (weight) {
                    setState(() {
                      _userWeight = weight;
                    });
                  },
                  value: _userWeight,
                  divisions: 560,
                  activeColor: Colors.black,
                  label: "$_userWeight",
                ),
              ),
              Center(
                child: Text(
                  "$_userWeight kg",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.grey,
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          _bmi = _userWeight /
                              ((_userHeight / 100) * (_userHeight / 100));

                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: true,
                                comments: "You are Totaly Fit!!!!");
                          } else if (_bmi < 18.5) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are UnderWeighted");
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are OverWeighted");
                          } else {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are Obesed");
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                        bmiModel: _bmiModel,
                                      )));
                        });
                      },
                      icon: Icon(Icons.favorite,color: Colors.black,),
                      label: Text("GoMyResults")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
class BMICalculation extends StatefulWidget {
  @override
  _BMICalculationState createState() => _BMICalculationState();
}

class _BMICalculationState extends State<BMICalculation> {
  double _userHeight = 100;
  double _userWeight = 40.0;
  double _bmi = 0;

  BMImodel _bmiModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * .1),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "- How about your \nBMI",
                        style: TextStyle(color: Colors.black, fontSize: 36)),
                    TextSpan(
                        text: " today?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold))
                  ]),
                ),
              ),
              SizedBox(height: 28),
              Center(
                child: Text(
                  "Height (cm)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 14, left: 14),
                child: Slider(
                  min: 80,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _userHeight = height;
                    });
                  },
                  value: _userHeight,
                  divisions: 100,
                  activeColor: Colors.black,
                  label: "$_userHeight",
                ),
              ),
              Center(
                child: Text(
                  "$_userHeight cm",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 22),
              Center(
                child: Text(
                  "Weight (kg)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 18, left: 18),
                child: Slider(
                  min: 30,
                  max: 170,
                  onChanged: (weight) {
                    setState(() {
                      _userWeight = weight;
                    });
                  },
                  value: _userWeight,
                  divisions: 100,
                  activeColor: Colors.black,
                  label: "$_userWeight",
                ),
              ),
              Center(
                child: Text(
                  "$_userWeight kg",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: FlatButton.icon(
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          _bmi = _userWeight /
                              ((_userHeight / 100) * (_userHeight / 100));

                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: true,
                                comments: "You are Totaly Fit!!!!");
                          } else if (_bmi < 18.5) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are UnderWeighted");
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are OverWeighted");
                          } else {
                            _bmiModel = BMImodel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "You are Obesed");
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                        bmiModel: _bmiModel,
                                      )));
                        });
                      },
                      icon: Icon(Icons.favorite),
                      label: Text("GoMyResults")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
