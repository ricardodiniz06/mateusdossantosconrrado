import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    String appChoice = arguments["appChoice"]!;
    String userChoice = arguments["userChoice"]!;

    bool userWon = false;
    bool draw = appChoice == userChoice;

    if (appChoice == "rock" && userChoice == "scissors") {
      userWon = false;
    } else if (appChoice == "rock" && userChoice == "paper") {
      userWon = true;
    } else if (appChoice == "paper" && userChoice == "rock") {
      userWon = false;
    } else if (appChoice == "paper" && userChoice == "scissors") {
      userWon = true;
    } else if (appChoice == "scissors" && userChoice == "rock") {
      userWon = true;
    } else if (appChoice == "scissors" && userChoice == "paper") {
      userWon = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Pedra, Papel, Tesoura", 
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset("lib/assets/images/$appChoice.png", width: 100,),
                Text(
                  "Escolha do App",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 150),

                Image.asset("lib/assets/images/$userChoice.png", width: 100,),
                Text(
                  "Sua Escolha",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 50),

                Image.asset(
                  draw ? "lib/assets/images/draw.png" : (userWon ? "lib/assets/images/win.png" : "lib/assets/images/lose.png"),
                  width: 100,
                ),
                Text(
                  draw ? "Empate!" : (userWon ? "Você Ganhou!" : "Você Perdeu!"),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 50),

                ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(
                    "Jogar Novamente", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}