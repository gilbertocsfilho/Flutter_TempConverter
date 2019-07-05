import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "TempConverter",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final celsiusController = TextEditingController();
  final fahrenheitController = TextEditingController();
  final kelvinController = TextEditingController();

  double celsius;
  double fahrenheit;
  double kelvin;

  void _clearAll() {
    celsiusController.text = "";
    fahrenheitController.text = "";
    kelvinController.text = "";
  }

  void _celsiusChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double celsius = double.parse(text);
    fahrenheitController.text = ((celsius * 9 / 5) + 32).toStringAsFixed(2);
    kelvinController.text = (celsius + 273.15).toStringAsFixed(2);
  }

  void _fahrenheitChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double fahrenheit = double.parse(text);
    celsiusController.text = ((fahrenheit - 32) * 5 / 9).toStringAsFixed(2);
    kelvinController.text =
        ((fahrenheit - 32) * 5 / 9 + 273.15).toStringAsFixed(2);
  }

  void _kelvinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double kelvin = double.parse(text);
    celsiusController.text = (kelvin - 273.15).toStringAsFixed(2);
    fahrenheitController.text =
        ((kelvin - 273.15) * 9 / 5 + 32).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("TempConverter"),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTextField(
                    "Celsius ºC", celsiusController, _celsiusChanged),
                Divider(),
                buildTextField(
                    "Fahrenheit ºF", fahrenheitController, _fahrenheitChanged),
                Divider(),
                buildTextField("Kelvin ºK", kelvinController, _kelvinChanged),
                Divider(),
                FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8),
                    splashColor: Colors.red,
                    onPressed: () {
                      _clearAll();
                    },
                    child: Text(
                      "Clear",
                      style: TextStyle(
                          fontSize: 11,
                          decorationStyle: TextDecorationStyle.solid),
                    ))
              ],
            ),
          )),
    );
  }
}

Widget buildTextField(String label, TextEditingController tec, Function func) {
  return TextField(
    controller: tec,
    decoration: InputDecoration(border: OutlineInputBorder(), labelText: label),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    onChanged: func,
  );
}
