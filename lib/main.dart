import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JS Calculadora',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Calculadora'),
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
  double? storedNumber;
  String? operator;
  String currentNumber = "0";
  String display = "0";

  void onButtonPress(String value) {
    setState(() {
      // para limpiar
      if (value == "C") {
        currentNumber = "0";
        storedNumber = null;
        operator = null;
        display = "0";
        return;
      }

      //decimal .

      //Numeros
      if (RegExp(r'[0-9]').hasMatch(value)) {
        if (currentNumber == "0") {
          currentNumber = value;
        } else {
          currentNumber += value;
        }
        display = currentNumber;
        return;
      }

      //Operadores
      if (value == "+" || value == "-" || value == "×" || value == "÷") {
        storedNumber = double.parse(currentNumber);
        operator = value;
        currentNumber = "0";
        return;
      }

      //Igual
      if (value == "=" && storedNumber != null && operator != null) {
        double second = double.parse(currentNumber);
        double result = 0;

        if (operator == "+") result = storedNumber! + second;
        if (operator == "-") result = storedNumber! - second;
        if (operator == "×") result = storedNumber! * second;
        if (operator == "÷") result = storedNumber! / second;

        display = result.toString();
        currentNumber = display;
        storedNumber = null;
        operator = null;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.black),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              // DISPLAY
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: const TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

              // BOTONES
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.1,
                  padding: const EdgeInsets.all(8),
                  children: [
                    BtnLight(numero: "C", onClick: onButtonPress),
                    BtnLight(numero: "()", onClick: onButtonPress),
                    BtnLight(numero: "%", onClick: onButtonPress),
                    BtnDark(simbolo: "÷", onClick: onButtonPress),

                    BtnLight(numero: "7", onClick: onButtonPress),
                    BtnLight(numero: "8", onClick: onButtonPress),
                    BtnLight(numero: "9", onClick: onButtonPress),
                    BtnDark(simbolo: "×", onClick: onButtonPress),

                    BtnLight(numero: "4", onClick: onButtonPress),
                    BtnLight(numero: "5", onClick: onButtonPress),
                    BtnLight(numero: "6", onClick: onButtonPress),
                    BtnDark(simbolo: "-", onClick: onButtonPress),

                    BtnLight(numero: "1", onClick: onButtonPress),
                    BtnLight(numero: "2", onClick: onButtonPress),
                    BtnLight(numero: "3", onClick: onButtonPress),
                    BtnDark(simbolo: "+", onClick: onButtonPress),

                    BtnLight(numero: "+/-", onClick: onButtonPress),
                    BtnLight(numero: "0", onClick: onButtonPress),
                    BtnLight(numero: ".", onClick: onButtonPress),
                    BtnBlue(simbolo: "=", onClick: onButtonPress),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
