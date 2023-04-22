import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'APP frases SENAI',
    home: frases(),
  ));
}

class frases extends StatefulWidget {
  const frases({Key? key}) : super(key: key);

  @override
  State<frases> createState() => _frasesState();
}

class _frasesState extends State<frases> {
  var _frases = [
    'Os 3 maiores crimes de um estudante do SENAI:\n\n'
        '1 - Vir sem uniforme\n\n'
        '2 - Chegar 1 min atrasado do intervalo na aula do James\n\n'
        '3 - Instalar CS 1.6 nas máquinas',
    'Nunca pergunte a uma mulher sua idade \n\n'
        'A um homem seu salario\n\n'
        'E a um estudante do SENAI sua opinião sobre o W3Schools',
    'Se tem uma coisa que eu aprendi com o Atila, é não fazer um import dentro de um laço de repetição.',
    'Em algum lugar, numa aula de Banco de Dados...\n\n'
    '"Cara, preenchi os dados no banco errado."\n\n'
        '"Puts... vamos ter que deletar o banco todo."',
    'Numa batalha entre um estudante do SENAI contra um da FATEC, sempre aposte no estudante da SENAI.'
  ];

  var _images = [
    'image/aluno_senai.jpg',
    'image/w3schools.jpg',
    'image/confia_atila.png',
    'image/banco_de_dados.png',
    'image/senai_fatec.png'
  ];

  var _frasesGerada = 'Clique abaixo para gerar uma frase relacionada ao SENAI';
  var _imagemGerada = 'image/logo-senai.png';

  void _gerarFrase() async {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _frasesGerada = _frases[numeroSorteado];
      _imagemGerada = _images[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('As melhores frases do SENAI'),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _imagemGerada,
                height: 200,
                width: 400,
              ),
              Text(
                _frasesGerada,
                style: TextStyle(
                  fontSize: 25,
                  // fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _gerarFrase,
                child: Text(
                  'Nova frase',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5020BD),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
