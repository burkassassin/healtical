import 'package:flutter/material.dart';



import 'User/user_choice.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomePage> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 500),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:[const Color(0xFFFFFFEE), const Color(0xFF999999)],
                        begin: const FractionalOffset(1, 1),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Health\n",
                                style: TextStyle(
                                    fontSize: 90,
                                    color: Colors.black,
                                    fontFamily: 'Quicksand')),
                            TextSpan(
                                text: "-iCal",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Quicksand Bold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                ))
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: RaisedButton.icon(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserChoice()));
                },
                icon: Icon(
                  Icons.accessibility_new,
                  color: Colors.black,
                ),
                color: Colors.grey,
                label: Text(
                  "GoCalculators",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
