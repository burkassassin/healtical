import 'package:bmi_app/results/result_basal.dart';
import 'package:flutter/material.dart';

class BasalCalculator extends StatefulWidget {
  @override
  _BasalCalculatorState createState() => _BasalCalculatorState();
}

class _BasalCalculatorState extends State<BasalCalculator> {
  double _userHeightt = 100;
  double _userWeightt = 40;
  double _userAge = 0;
  double bmr = 0;
  double selectedGenderValue = 66.5;

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
                  color: Colors.grey),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "- Learn your \n",
                            style: TextStyle(color: Colors.black, fontSize: 30)),
                        TextSpan(
                            text: "basal metabolic rate !",
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
                      _userHeightt = height;
                    });
                  },
                  value: _userHeightt,
                  divisions: 680,
                  activeColor: Colors.black,
                  label: "$_userHeightt",
                ),
              ),
              Center(
                child: Text(
                  "$_userHeightt cm",
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
                      _userWeightt = weight;
                    });
                  },
                  value: _userWeightt,
                  divisions: 560,
                  activeColor: Colors.black,
                  label: "$_userWeightt",
                ),
              ),
              Center(
                child: Text(
                  "$_userWeightt kg",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 22),
              Center(
                child: Text(
                  "Age",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 18, left: 18),
                child: Slider(
                  min: 0,
                  max: 150,
                  onChanged: (age) {
                    setState(() {
                      _userAge = age;
                    });
                  },
                  value: _userAge,
                  divisions: 150,
                  activeColor: Colors.black,
                  label: "$_userAge",
                ),
              ),
              Center(
                child: Text(
                  "$_userAge",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                          if (selectedGenderValue == 66.5) {
                            bmr = selectedGenderValue +
                                (13.7 * _userWeightt) +
                                (5 * _userHeightt) -
                                (6.7 * _userAge);
                          } else {
                            bmr = selectedGenderValue +
                                (9.6 * _userWeightt) +
                                (1.8 * _userHeightt) -
                                (4.7 * _userAge);
                          }
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultofBMR(
                                      bmr: bmr,
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
    value: 66.5,
  ));
  gender.add(DropdownMenuItem(
    child: Text(
      "Female",
      style: TextStyle(fontSize: 20),
    ),
    value: 65.5,
  ));
  return gender;
}
