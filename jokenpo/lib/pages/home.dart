import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final List<String> choices = ["rock", "paper", "scissors"];

  String appChoice = "";
  String userChoice = "";

  void setUserChoice(String choice) {
    userChoice = choice;
    appChoice = choices[Random().nextInt(choices.length)];
    Navigator.pushReplacementNamed(
      context, 
      "/result", 
      arguments: {
        "appChoice": appChoice,
        "userChoice": userChoice,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Pedra, Papel, Tesoura", 
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset("lib/assets/images/default.png", width: 100,),
              Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var choice in choices) ...[
                GestureDetector(
                  onTap: () => setUserChoice(choice),
                  child: Image.asset("lib/assets/images/$choice.png", width: 100,),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}