import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  double height = 0;
  double weight = 0;
  String result = '';
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  void calculateBMI(double height, double weight) {
    double finalResult = weight / (height * height / 1000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomRadioButton('Male', Colors.blue, 0),
                    CustomRadioButton('Female', Colors.pink, 1)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your Height in cm',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: heightController,
                    decoration: InputDecoration(
                        hintText: 'Your height in cm',
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 238, 238),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your Weight in kg',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: weightController,
                    decoration: InputDecoration(
                        hintText: 'Your weight in kg',
                        filled: true,
                        fillColor: Color.fromARGB(255, 238, 238, 238),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      setState(() {
                        height = double.parse((heightController.value.text));
                        weight = double.parse((weightController.value.text));
                      });
                      calculateBMI(height, weight);
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your BMI is: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget CustomRadioButton(String value, Color color, int index) {
    // return Expanded(child: Container(child: FlatButton(color:currentIndex==index?color:Colors.grey[200],shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) ),))

    return (Expanded(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            height: 80,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      currentIndex == index
                          ? color
                          : Color.fromARGB(255, 220, 220, 220)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              onPressed: () {
                changeIndex(index);
              },
              child: Text(
                value,
                style: TextStyle(
                    color: currentIndex == index ? Colors.white : color,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ))));
  }
}
