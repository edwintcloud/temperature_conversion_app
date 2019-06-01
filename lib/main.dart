import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  double input;
  double output;
  bool isFahrenheit;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    isFahrenheit = true;
  }

  @override
  Widget build(BuildContext context) {
    Container inputField = Container(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (str) {
          try {
            input = double.parse(str);
          } catch (e) {
            input = 0.0;
          }
        },
        decoration: InputDecoration(
          labelText:
              "Input a Value in ${isFahrenheit ? "Fahrenheit" : "Celsius"}",
        ),
      ),
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Conversion Calculator"),
    );

    Container tempSwitch = Container(
      child: Column(
        children: <Widget>[
          // Switch(
          //   value: isFahrenheit,
          //   onChanged: (e) {
          //     setState(() {
          //       isFahrenheit = !isFahrenheit;
          //     });
          //   },
          // )
          // Checkbox(
          //   value: isFahrenheit,
          //   onChanged: (e) {
          //     setState(() {
          //       isFahrenheit = !isFahrenheit;
          //     });
          //   },
          // )
          Row(
            children: <Widget>[
              Radio<bool>(
                groupValue: isFahrenheit,
                value: true,
                onChanged: (v) {
                  setState(() {
                    isFahrenheit = v;
                    output = 0.0;
                  });
                },
              ),
              Text("Fahrenheit"),
              Radio<bool>(
                groupValue: isFahrenheit,
                value: false,
                onChanged: (v) {
                  setState(() {
                    isFahrenheit = v;
                    output = 0.0;
                  });
                },
              ),
              Text("Celsius"),
            ],
          ),
        ],
      ),
    );

    Container calculateButton = Container(
      padding: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        child: Text("Calculate"),
        onPressed: () {
          setState(() {
            isFahrenheit
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
          });
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(7.0),
        child: Column(
          children: <Widget>[
            tempSwitch,
            inputField,
            calculateButton,
            Container(
              padding: EdgeInsets.only(top: 100.0),
              child: output != 0.0
                  ? Text(
                      "Result: ${output.toStringAsFixed(0)}° ${isFahrenheit ? "C" : "F"}",
                      style: TextStyle(fontSize: 26.0, color: Colors.green),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
