import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var bgColors = Colors.amber.shade200;

  var resulte = '';

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var InController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: bgColors,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter your Weight'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height (in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextField(
                    controller: InController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height(in Inches)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var Inch = InController.text.toString();

                        if (wt != '' && ft != '' && Inch != '') {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(Inch);

                          var tInch = (ift * 12) + iInch;

                          var tCm = tInch * 2.54;

                          var tm = tCm / 100;

                          var bmi = iwt / (tm * tm);

                          var msg;

                          if (bmi > 25) {
                            msg = "You're Over Weight!";
                            bgColors = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You're Under Weight!";
                            bgColors = Colors.red.shade200;
                          } else {
                            msg = "You're Healthy!";
                            bgColors = Colors.green.shade200;
                          }

                          setState(() {
                            resulte =
                                '$msg \n your BMI is ${bmi.toStringAsFixed(2)}';
                            // wtController.text = "";
                            // ftController.text = "";
                            // InController.text = "";
                          });
                        } else {
                          setState(() {
                            resulte = 'Please provide all fields to calculate';
                            bgColors = Colors.redAccent.shade100;
                          });
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    resulte,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
