import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _options = ["papel", "pedra", "tesoura"];
  var _mensagem = "Escolha uma opção abaixo";

  _escolhaPC() {
    var escolha = Random().nextInt(_options.length);
    return escolha;
  }

  _escolha(String escolha) {
    var escolhaPC = _options[_escolhaPC()];
    print("Escolha do pc: " + escolhaPC);
    print("Escolha do usuário: " + escolha);

    // imagem escolhida pelo pc
    setState(() {
      this._imagemApp = AssetImage("images/" + escolhaPC + ".png");

      // validacao
      //empate
      if(escolha == escolhaPC) {
        this._mensagem = "Houve um empate!";
      }

      // usuario ganhador
      if(
          escolha == "pedra" && escolhaPC == "tesoura" ||
          escolha == "tesoura" && escolhaPC == "papel" ||
          escolha == "papel" && escolhaPC == "pedra"
      ) {
        this._mensagem = "Você venceu!";
      }

      // pc ganhador
      if(
          escolhaPC == "pedra" && escolha == "tesoura" ||
          escolhaPC == "tesoura" && escolha == "papel" ||
          escolhaPC == "papel" && escolha == "pedra"
      ) {
        this._mensagem = "Você perdeu!";
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 16),
                    child: Text(
                      "Escolha do computador:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Image(image: this._imagemApp),
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 32),
                    child: Text(
                      this._mensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _escolha("pedra"),
                        child: Image.asset("images/pedra.png", height: 95),
                      ),
                      GestureDetector(
                        onTap: () => _escolha("papel"),
                        child: Image.asset("images/papel.png", height: 95),
                      ),
                      GestureDetector(
                        onTap: () => _escolha("tesoura"),
                        child: Image.asset("images/tesoura.png", height: 95),
                      ),
                    ],
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
