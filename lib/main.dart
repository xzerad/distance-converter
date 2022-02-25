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
    "Centimeter",
    "Meter",
    "Kilometer",
    "Inch",
    "Feet",
  ];

  Map distanceValues = {
    "Centimeter" : {
      "Centimeter": 1,
      "Meter": 0.01,
      "Kilometer": 0.00001,
      "Inch": 0.3937008,
      "Feet": 0.0328084
    },
    "Meter":{
      "Centimeter": 100,
      "Meter": 1,
      "Kilometer": 0.001,
      "Inch": 39.37008,
      "Feet": 3.28084
    },
    "Kilometer": {
      "Centimeter": 100000,
      "Meter": 1000,
      "Kilometer": 1,
      "Inch": 39370.08,
      "Feet": 3280.84
    },
    "Inch": {
      "Centimeter": 2.54,
      "Meter": 0.0254,
      "Kilometer": 0.001,
      "Inch": 1,
      "Feet": 0.0000254
    },
    "Feet": {
      "Centimeter": 30.48,
      "Meter": 0.3048,
      "Kilometer": 3.048e-4,
      "Inch": 12,
      "Feet": 1
    }
  };

  TextEditingController controller = TextEditingController();

  String? fromUnit ;
  String? toUnit;
  int? number;

  _ConverterUiState(){
    fromUnit = distanceUnit[0];
    toUnit = distanceUnit[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: Center(
      child: Column(children:[

          Padding(padding: const EdgeInsets.all( 25),
            child:
            TextField(controller: controller, onChanged: (txt){
              setState(() {
                number = int.tryParse(txt);
              });
            }, textAlign: TextAlign.center,)
        ),
        Row(
          children:  [
            const Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child:
              Text("From", style:
              TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20)
              )
        ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: DropdownButton<String>(value: fromUnit, onChanged: (value) {  setState(() {
                    fromUnit = value;
                  });},
                    items: distanceUnit.map((e) => DropdownMenuItem<String>(value: e,
                      child: Text(e),)).toList(),
                  )
              )
            ,

            ],
        ),

          Row(
            children: [
               const Padding(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child:
                  Text("To", style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20)
                  )
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: DropdownButton<String>(value: toUnit, onChanged: (value) {  setState(() {
                    toUnit = value;
                  });},
                    items: distanceUnit.map((e) => DropdownMenuItem<String>(value: e,
                      child: Text(e),)).toList(),
                  )
              ),
            ],
          ),

        Padding(padding: const EdgeInsets.symmetric(vertical: 25),
            child:  Text(number!= null ?"Result = "+(distanceValues[fromUnit][toUnit]*number).toString(): "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
        )
      ]
      )
    ));
  }
}
