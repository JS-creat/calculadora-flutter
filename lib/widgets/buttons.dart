import 'package:flutter/material.dart';

class BtnLight extends StatelessWidget {
  final String numero;
  final void Function(String) onClick;

  const BtnLight({super.key, required this.numero, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
        onPressed: () => onClick(numero),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[850],
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          numero,
          style: const TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}

class BtnDark extends StatelessWidget {
  final String simbolo;
  final void Function(String) onClick;

  const BtnDark({super.key, required this.simbolo, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
        onPressed: () => onClick(simbolo),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          simbolo,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}

class BtnBlue extends StatelessWidget {
  final String simbolo;
  final void Function(String) onClick;

  const BtnBlue({super.key, required this.simbolo, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
        onPressed: () => onClick(simbolo),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          simbolo,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}
