//import 'package:bmi_app/models/ideal_model.dart';
import 'package:bmi_app/results/result_IDW.dart';
import 'package:flutter/material.dart';

class IdealCalculator extends StatefulWidget {
  @override
  _IdealCalculatorState createState() => _IdealCalculatorState();
}

class _IdealCalculatorState extends State<IdealCalculator> {
  double _userHeightt = 100;
  double iwm = 0;
  double selectedGenderValue = 50;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * .1),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "- What should be your \n",
                            style: TextStyle(color: Colors.black, fontSize: 30)),
                        TextSpan(
                            text: "ideal weight?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Height (cm)",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(right: 14, left: 14),
                child: Slider(
                  min: 80,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _userHeightt = height;
                    });
                  },
                  value: _userHeightt,
                  divisions: 680,
                  activeColor: Colors.black,
                  label: "$_userHeightt",
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "$_userHeightt cm",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                child: Center(
                    child: DropdownButtonHideUnderline(
                  child: DropdownButton<double>(
                    items: selectedGenderItems(),
                    value: selectedGenderValue,
                    onChanged: (chosenGender) {
                      setState(() {
                        selectedGenderValue = chosenGender;
                      });
                    },
                  ),
                )),
              ),
              SizedBox(height: 40),
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
                          iwm = selectedGenderValue +
                              2.3 * ((_userHeightt / 2.54) - 60);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultofIdealWeight(
                                      iwm: iwm,
                                    )));
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

List<DropdownMenuItem<double>> selectedGenderItems() {
  List<DropdownMenuItem<double>> gender = [];

  gender.add(DropdownMenuItem(
    child: Text(
      "Male",
      style: TextStyle(fontSize: 20),
    ),
    value: 50,
  ));
  gender.add(DropdownMenuItem(
    child: Text(
      "Female",
      style: TextStyle(fontSize: 20),
    ),
    value: 45.5,
  ));
  return gender;
}
