import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Distance Converter",
        home: Scaffold(
            appBar: AppBar(title: const Text("Distance Converter")),
            body: const ConverterUi()
        ),
    );
  }
}

class ConverterUi extends StatefulWidget {
  const ConverterUi({Key? key}) : super(key: key);

  @override
  _ConverterUiState createState() => _ConverterUiState();
}

class _ConverterUiState extends State<ConverterUi> {
  List distanceUnit = <String>[
    "Meter",
    "Inch",
    "Feet",

  ];

  TextEditingController controller = TextEditingController();

  String? fromUnit ;
  String? toUnit;

  _ConverterUiState(){
    fromUnit = distanceUnit[0];
    toUnit = distanceUnit[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: Center(
      child: Column(children:[
          Padding(padding: const EdgeInsets.all( 30),
            child:
            TextField(controller: controller)
        ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30),
            child:
              Text("From", style:
                            TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 20)
              )
        ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 30),
            child: DropdownButton<String>(value: fromUnit, onChanged: (value) {  setState(() {
              fromUnit = value;
            });},
              items: distanceUnit.map((e) => DropdownMenuItem<String>(value: e,
                                              child: Text(e),)).toList(),
            )
        ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30),
            child:
            Text("To", style:
            TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20)
            )
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 30),
            child: DropdownButton<String>(value: toUnit, onChanged: (value) {  setState(() {
              toUnit = value;
            });},
              items: distanceUnit.map((e) => DropdownMenuItem<String>(value: e,
                child: Text(e),)).toList(),
            )
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 30),
            child:
              ElevatedButton(onPressed: () {  },
              child: const Text("Convert"),)
        ),
       const Padding(padding: EdgeInsets.symmetric(vertical: 30),
            child: Text("bla bla bla")
        )
      ]
      )
    ));
  }
}
