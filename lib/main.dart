import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'APP frases Aqua Teen',
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
    '"Vai ver o que esse cagão quer e depois me diz o assunto" - Shake',
    '"Deus, por que me amaldiçoaste com tanta popularidade?" - Shake',
    '"Você é um rapaz novo, um rapaz bem abençoado, uma barriguinha bonita, os peito bonito. Invista seu dinheiro em imoveis!" - Shake',
    '"Puts grila, eu não aguento aquele cara ele é muito irritante." - Fantasma Cibernético do Natal Passado',
    '"E eu sei lá p****!" - Fantasma Cibernético do Natal Passado',
    '"Vocês podem me dizer como eu compro ações? É na galinha ou é no porco?" - Shake',
    '"Eu acho que vou rezar para jesus." - Shake',
    '"Aqui é o Carl, é gostoso e não faz mal" - Carl',
    '"Ih cacete, fui eu" - Fantasma Cibernético do Natal Passado',
    '"Bom, a explicação vai demorar pra cacete. Vai la fora comer o angu do Gomes" - Fantasma Cibernético do Natal Passado',
    '"Essa parada é ilegal..." - Carl',
    '"Ei, quem é que vai me prender? Essas p**** de árvore?" - Carl',
    '"Faz o seguinte gordo, vai lá em casa e usa nosso banheiro" - Fritoso',
    '"Levanta, SEU BUNDÃO" - Fantasma Cibernético do Natal Passado'
  ];

  var _frasesGerada = 'Clique abaixo para gerar uma frase do Aqua Teeen';

  void _gerarFrase() async {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _frasesGerada = '';
    });

    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      _frasesGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('As melhores frases Aqua Teen'),
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
              Image.asset('image/aqua-teen.gif'),
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
