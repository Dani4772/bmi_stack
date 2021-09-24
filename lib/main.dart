import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 2.5;
  double _bmi = 0;
  double _num = 0;
  double _num1 = 2.5;
  double _num2 = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(

clipBehavior: Clip.none,
              children: [
              Container(
                height: 450.0,
                color: getBodyType2(_bmi),
                child: Center(
                    child:
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Image.asset(
                            getBodyType(_bmi),
                            width: 70,
                          ),
                          SizedBox(height: 5,),
                          Text( getBodyType1(_bmi,),style: TextStyle(color: Colors.black,
                              fontSize: 22, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    )
                ),
              ),
            Positioned(
              bottom: -80,
              left: 120,
              // (background container size) - (circle height / 2)
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 8),
                ),
                child: Center(
                    child: _num ==0?   Text(
                      'Waiting',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ):Text(doubleresult(_num),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),),
              ),
            ),
      ],
    ),Expanded(child: SingleChildScrollView(child: Column(

              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Text("Height (cm)",
                        style: TextStyle(color: Colors.grey,
                            fontSize: 24, fontWeight: FontWeight.w400),),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Slider(
                          min: 80.0,
                          max: 250.0,
                          onChanged: (height){
                            setState(() {
                              _heightOfUser = height;
                              _num2 = double.parse((_heightOfUser).toStringAsFixed(2));


                            });
                          },
                          value: _num2,
                          divisions: 100,
                          activeColor: Colors.pink,
                          label: "$_num2",
                        ),
                      ),
                      Text("$_num2 cm",
                        style: TextStyle(color: Colors.red,
                            fontSize: 18, fontWeight: FontWeight.w900),),
                      SizedBox(height: 50,),
                      Text("Weight (kg)",
                        style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Slider(
                          min: 1.0,
                          max: 120.0,
                          onChanged: (height){
                            setState(() {
                              _weightOfUser = height;
                              _num1 = double.parse((_weightOfUser).toStringAsFixed(2));
                            });
                          },
                          value: _num1,
                          divisions: 100,
                          activeColor: Colors.pink,
                          label: "$_num1",
                        ),
                      ),

                      Text("$_num1 kg",
                        style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
                      SizedBox(height: 16,),

                      Container(
                        child:
                        ElevatedButton(
                          onPressed: () {
                            setState(() {

                              _bmi = bmi_formula(_weightOfUser,_heightOfUser);
                              _num = double.parse((_bmi).toStringAsFixed(2));
                            });
                          },
                          child: Text('Calculate'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(170, 55),
                            primary: Color(0xFF526091),
                            side:
                            BorderSide(width: 3, color: Colors.transparent),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 16, right: 16),
                      ),
                    ],
                  ),
                ),

              ],
            ),)),

          ],
        )

        );
  }
}

double bmi_formula(double weight, double height) {
  return weight / ((height / 100) * (height / 100));
}

doubleresult(double _num) {
  if (_num != null) return 'BMI IS $_num';
}

String getBodyType(double _bmi) {
  if (_bmi == 0) {
    return 'assets/images/thinking.png';
  } else if (_bmi <= 18.5) {
    return 'assets/images/weak.png';
  } else if (_bmi >= 18.5 && _bmi <= 25) {
    return 'assets/images/normal.png';
  } else if (_bmi > 25 && _bmi < 30) {
    return 'assets/images/healthy.png';
  } else if (_bmi > 30 && _bmi < 34) {
    return 'assets/images/obese.png';
  } else {
    return 'assets/images/extremely_obese.png';
  }
}

Color getBodyType2(double _bmi) {
  if (_bmi == 0) {
    return Colors.yellow;
  } else if (_bmi <= 18.5) {
    return Colors.blue;
  } else if (_bmi >= 18.5 && _bmi <= 25) {
    return Colors.black;
  } else if (_bmi > 25 && _bmi < 30) {
    return Colors.purple;
  } else if (_bmi > 30 && _bmi < 34) {
    return Colors.pink;
  } else {
    return Colors.brown;
  }
}

String getBodyType1(double _bmi) {
  if (_bmi == 0) {
    return 'Thinking';
  } else if (_bmi <= 18.5) {
    return 'You are weak';
  } else if (_bmi >= 18.5 && _bmi <= 25) {
    return 'You are Normal';
  } else if (_bmi > 25 && _bmi < 30) {
    return 'You are Healthy';
  } else if (_bmi > 30 && _bmi < 34) {
    return 'You are  Obesed';
  } else {
    return 'You are Extremely Obesed';
  }
}
